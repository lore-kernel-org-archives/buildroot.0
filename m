From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 May 2018 23:37:31 +0200
Subject: [Buildroot] [PATCH 1/1] libgdiplus: bump to version 5.6
In-Reply-To: <CANu7NGvp9ZFropp5ckpT5B59AVzv=xCM0_ctovdAQ4eU=7W_Qw@mail.gmail.com>
References: <20180430190840.11455-1-fontaine.fabrice@gmail.com>
 <20180501214047.1d9f818c@windsurf.home>
 <CANu7NGvp9ZFropp5ckpT5B59AVzv=xCM0_ctovdAQ4eU=7W_Qw@mail.gmail.com>
Message-ID: <c44943bd-29e4-8ebb-1798-ce71f4e2d059@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-05-18 19:20, Sergio Prado wrote:
> Hello,
> 
>> On Mon, 30 Apr 2018 21:08:40 +0200, Fabrice Fontaine wrote:
>>
>> > ?# Although there is a LICENSE file thas specifies LGPL or MPL-1.1,
>> > ?# looks like it is incorrect. The actual source files specify that
>> > -# they're licensed under MIT, and so does the COPYING file (and they
>> > -# all predate the addition of the LICENSE file).
>> > +# they're licensed under MIT, and so does the original (before its
>> > +# removal/update) COPYING file (and they all predate the addition of
>> > +# the LICENSE file).
>> > ?LIBGDIPLUS_LICENSE = MIT
>> > -LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h
>> > +LIBGDIPLUS_LICENSE_FILES = src/carbon-private.h
>> >
>> > ?LIBGDIPLUS_INSTALL_STAGING = YES
>>
>> Hum, this feels weird. They have re-added a COPYING file pointing to
>> the LICENSE file, which itself that says LGPL or MPL, so perhaps this
>> isn't wrong after all ?
>>
>> carbon-private.h might be MIT licensed, but the whole work may still be
>> released under LGPL or MPL.
>>
>> See https://github.com/mono/libgdiplus/blob/master/LICENSE
>>
>> So I believe our assessment that the LICENSE file was wrong when it was
>> saying LGPL or MPL-1.1 is not correct, and we should change the license
>> details of libgdiplus to LGPL-2.1 or MPL-1.1.
>>
>> Sergio, you originally contributed libgdiplus, what do you think ?
> 
> I agree.
> 
> From the git commit logs, initially there was no LICENSE file and the license
> was MIT, as described in COPYING. Eight months later the LICENSE file was added
> with the message "Add new license", so we might assume the license changed
> to?LGPL-2.1 or MPL-1.1, but they forgot to remove COPYING. In 2015 COPYING was
> removed and added later just because of autotools (based on the commit logs),
> but now pointing to LICENSE. So looks like our?assessment of the license was
> wrong, and we should change to LGPL-2.1 or MPL-1.1.

 So I did some research on this. It's complicated :-)

 Since 2004 already, there has been a LICENSE file with the text "Libgdiplus is
licensed under the terms of the GNU Library GPL or the Mozilla Public License
1.1." and with the details of the MPL (but not the LGPL!) in MPL-1.1.html.
However, no license headers in source files were updated.

 In 2009, a spec file was added that says
License:        LGPL v2.1 only; MOZILLA PUBLIC LICENSE (MPL/NPL); X11/MIT
This file was added by someone from Novell, and Novell is mentioned in all the
copyright headers in the source files.

 I haven't traced exactly when, but at some point contributions started
requiring copyright assignment to Xamarin. For contributions between the
addition of the LICENSE file and the copyright assignments, I think the status
is a little unclear.

 Since 2016, instead of a copyright assignment, there is a Contributor License
Agreement which basically licenses the .NET Foundation to relicense the code
under whatever license they want.

 In September 2017, the MPL-1.1 and the LGPL-2.1 license texts were added to the
LICENSE file, and MPL-1.1.html was removed.

 And finally, libgdiplus is part of the Mono project, and the Mono licensing FAQ
says: "The Mono runtime, compilers and tools and most of the class libraries are
licensed under the MIT license." (but libgdiplus is not really part of the mono
runtime, compilers, tools or class libraries; it's an independent library that
is used by the Mono project, probably by nobody else).


 Bottom line:

- The license situation really hasn't changed since 2004.
- Based on the information in the source tarball, it should be (LGPL-2.1 OR
MPL-1.1) AND MIT.
- But the intention is probably MIT.

 So I've opened an issue[1] to clarify the situation. I've also marked the v2 of
this patch as Deferred and delegated to me.

 Regards,
 Arnout

[1] https://github.com/mono/libgdiplus/issues/375


> 
> Best regards,
> 
> Sergio Prado
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
