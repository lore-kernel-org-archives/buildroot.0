From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 23:35:22 +0100
Subject: [Buildroot] [PATCH v2 3/5] COPYING: add exception about patch
	licensing
In-Reply-To: <20160203230208.GB3428@free.fr>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
 <20160203230208.GB3428@free.fr>
Message-ID: <56BBBB2A.1060706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-02-16 00:02, Yann E. MORIN wrote:
> Luca, All,
> 
> On 2016-02-01 23:19 +0100, Luca Ceresoli spake thusly:
>> > Several people have been asking what is the license of the patches
>> > provided by Buildroot. COPYING is the authoritative place to state it.
>> > 
>> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> > Cc: Arnout Vandecappelle <arnout@mind.be>
>> > ---
>> > Changes v1 -> v2:
>> >  - Rewrite it almost entirely (Arnout, Thomas).
>> > ---
>> >  COPYING | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> > 
>> > diff --git a/COPYING b/COPYING
>> > index d511905..3596777 100644
>> > --- a/COPYING
>> > +++ b/COPYING
>> > @@ -1,3 +1,11 @@
>> > +Except for the patches provided for packages, Buildroot is licensed
>> > +under the GNU General Public License, version 2.
> There a gotcha here. The manual states, in chapter 12.3:
> 
>     Buildroot [is] released under the GNU General Public License,
>     version 2 or (at your option) any later version.
> 
> So, we have to clarify: is it GPLv2 or GPLV2+ ?
> 
> It's too late today for me to go digging; I'll do that tomorrow. Just
> rmind me before the end of the week if there's not feedback from my part
> on this topic.

 Reminder :-)

 But I did the digging. The situation is of course complicated.

 We don't have many files that specify a license by themselves. All of them
specify 'or later', except for makedevs.c (obviously, because it is copied from
busybox), toolchain-wrapper.c (added by Peter in 2011), and the manual itself,
which specify v2 only.

 The top-level Makefile is the only thing of which you could say that it has
project-wide scope. And that says 'or later'.

 So, what does that mean for buildroot as a whole? I think it is GPLv2+, except
for the package patches and except for the files that explicitly specify a
different license. Can we fit that in the formulation that evolved in this thread?


 Regards,
 Arnout

> 
> Until then, NAK.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
