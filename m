From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Feb 2018 22:30:37 -0600
Subject: [Buildroot] [NEXT 01/26] cpe-info: new make target
In-Reply-To: <20180227224038.30ae1e48@windsurf.lan>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227224038.30ae1e48@windsurf.lan>
Message-ID: <CANQCQpZcZy-BXL+=R9fWPMVBOyBad2qtVo=OhX5ZkDc59WP2hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 27, 2018 at 3:40 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 26 Feb 2018 20:10:16 -0600, Matt Weber wrote:
>> Similar to make legal-info, produce a csv delimited
>> file containing all selected packages CPE
>> identification.
>>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[snip]
>
> A question is: do we need a new make target, or can an external script
> do the same thing ?
>
> After all, "make printvars" gives you pretty much the needed
> information. All what is missing is that you can't easily get the list
> of selected packages in the current configuration, but that would be
> useful for me for the pkg-stats script as well. So a "make
> show-packages" or "make list-packages" could be useful.
>
> Perhaps that's how we can make our two different needs converge: by
> having external scripts rather than adding more stuff to the package
> infrastructure. A ./utils/cpe-report script could do pretty much what
> you've done here.
>
> Thoughts ?

I was on the fence when I looked at where to make the change.  I went
the infra route because it ended up being really simple to generate
that data and the whole process seamed clean.  I could see after
creating some of the CPE maintaining scripting we could easily convert
to your suggested approach for the report generation as well.  I just
didn't want the creation of the CPE scripting holding up the reporting
function, as I can get more developers to focus on improving the CPE
information across a few products over the next quarter if I have the
reports.

We have been looking at the pkg-stats script and thinking about the
impl steps to take.  hoping to get more time on them next month.

Matt
