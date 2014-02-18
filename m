From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 18 Feb 2014 16:55:38 +0100
Subject: [Buildroot] [PATCH v4 7/7] Makefile: export PATH
In-Reply-To: <20140218163756.0e495167@skate>
References: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
 <1392559113-5215-8-git-send-email-s.martin49@gmail.com>
 <5302FE90.9070402@mind.be> <20140218163756.0e495167@skate>
Message-ID: <CAHXCMMKD3N0rUz4fBQfM0gjhu-_RVWn+ae8DvcYkXpV-kxCLkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas,

On Tue, Feb 18, 2014 at 4:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 18 Feb 2014 07:32:48 +0100, Arnout Vandecappelle wrote:
>> On 16/02/14 14:58, Samuel Martin wrote:
>> > This can be useful for:
>> > - package using custom build system that are not aware that the host
>> >   tree is in $(O)/host/;
>> > - post-{build,image} scripts, in case some host-tools were specifically
>> >   built to be used by these scripts.
>>
>>  This makes all the previous patches redundant, since the PATH=...
>> invocations should be removed instead of renamed.
>
> Agreed. Samuel, you should make a choice:
>
>  * Either you use BR_PATH, and we continue to pass PATH=$(BR_PATH)
>    whenever the PATH is needed.
>
>  * Or you simply directly export PATH with the right value, and remove
>    all occurrences where we manually pass PATH=<something>.

Ok.
It was not clear whether the export would be accepted...
So I followed the secure way, thinking that the PATH usage could be
cleaned up later ;-)

Anyway, now it's my call. :)
Thanks for clarification.


Regards,


-- 
Samuel
