From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 8 Oct 2015 19:50:11 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <20151008181353.GF12078@waldemar-brodkorb.de>
References: <1442685931-20556-1-git-send-email-brendanheading@gmail.com>
 <CA+BsyQ72v3_sc7Luec6n=Ap-WWxd6JNg+X_Aha3UL4OJqZvTcg@mail.gmail.com>
 <20151008181353.GF12078@waldemar-brodkorb.de>
Message-ID: <CA+BsyQ7XDnn9KWVssW0_WKnFUxGaGZdJ-Gs2tHky_Hgo+n7bnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Not yet Waldemar .. I started a new job recently and I need to have a
word with them before I submit any more patches. Hope to have updates
soon ..

regards

Brendan

On 8 October 2015 at 19:13, Waldemar Brodkorb <mail@waldemar-brodkorb.de> wrote:
> Hi Brendan,
>
> any news about this?
>
> Brendan Heading wrote,
>
>> On 19 September 2015 at 19:05, Brendan Heading <brendanheading@gmail.com> wrote:
>> > Fixes:
>> > http://autobuild.buildroot.net/results/123/123a5b3f72ba8c1a4aa1cea5b7b846a04fd4e923/
>> > http://autobuild.buildroot.net/results/38c/38cfa4e7249a8770b06dbd392acba79303d3f9bc/
>> >
>> > .. and others.
>> >
>> > Improve GCC's checking of stack smashing support, adding a specific case
>> > statement for uclibc, and removing the check done after checking the
>> > glibc version.
>> >
>> > Signed-off-by: Brendan Heading <brendanheading@gmail.com>
>> > ---
>> > Patch V1 - this initial version only fixes 4.7.4 - wanted to check that
>> > we are heading the right way before I fix all the other versions.
>> >
>> > Note that I manually modified configure, rather than regenerating it from
>> > configure.ac.
>> >
>> > Original plan was to reverse the order of the existing __GLIBC_MINOR__ and
>> > uclibc check. However, the uclibc check falls through if it does not
>> > detect uclibc, so I figure it better to add the separate case statement.
>>
>> Hi guys,
>>
>> Just a quick ping to draw your attention to the above patch. Before I
>> add the fix to all the other supported versions of GCC I wanted to
>> check that you are happy with the way I'm solving the problem in
>> 4.7.4.
>>
>> Brendan
>>
