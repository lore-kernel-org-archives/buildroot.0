From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 28 Sep 2011 13:22:32 +0200
Subject: [Buildroot] add fcgi-2.4.0 package to buildroot
References: <000301cc7486$0778f8f0$166aead0$@com> <op.v15jbakh705kjs@rico>
 <op.v2ij9pax705kjs@rico> <201109280603.45562.minimod@morethan.org>
Message-ID: <op.v2im7uzm705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.09.2011, 13:03 Uhr, schrieb Michael S. Zick  
<minimod@morethan.org>:

> On Wed September 28 2011, Rico Bachmann wrote:
>> Am 21.09.2011, 11:29 Uhr, schrieb Rico Bachmann
>> <bachmann@tofwerk.com>:
>>
>> > Am 19.09.2011, 22:46 Uhr, schrieb Thomas Petazzoni
>> > <thomas.petazzoni@free-electrons.com>:
>> >>
>> >> Can you post a proper patch (sent with git send-email so that it
>> >> doesn't get screwed up by your e-mail client) so that we can test and
>> >> help you in fixing the problem?
>> >>
>> >> Thanks!
>> >>
>> >> Thomas
>> >
>> > As soon as I've done a proper patch, i will send it.
>> > But I could use a moment. I'm really a newbie in that section
>>
>> Is there a good tutorial to use git send-email, at the moment i have a
>> patch
>> that allows me to build my rootfs with the libfcgi.
>> I attached the patches without git send-email.
>> I hope it's not totaly screwed up.
>>
>
> You might want to check the contents of the patch files attached
> to your post.  ;-)
>
> Unless you intended to send two, one-line, patches -
> something is missing from each.
>
> Mike

I created the patches with this command:

  diff -u path/originalfile path/newfile > mypatch.patch

there should be everything needed in the file content.
at least they're working fine for me, i can use the patches wih this  
command:

  patch p0 -i mypatch.patch

and it is only one-line per patch i have to change.
It's the missing link to the math library by the LDFLAGS which wasn't set.

Rico

>>
>> How can i use the patch automatically in buildroot?
>> it should patch the make files from the libfcgi package after extracting
>> them from the tarball.
>> At the moment I run make, wait for the error, patch the files, run make
>> again...
>> I think i have to add some commands in the libfcgi.mk file.
>>
>> And should I commit my integration of libfcgi to the buildroot project?
>> Maybe there are other people that like to compile some fcgi applications
>> directly on the embedded system.
>>
>> Greez
>> Rico
