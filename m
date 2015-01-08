From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 08 Jan 2015 11:24:48 +0100
Subject: [Buildroot] host-python build issue
In-Reply-To: <20150108105629.2d8308bc@free-electrons.com>
References: <54AD3069.8090309@gmail.com>	<20150107174313.3d9ea5ff@free-electrons.com>	<CALo-6+jKLNFqOG08oQbWZOd2RSjoeF8aFkS-zBY5Y77JNtd5Qg@mail.gmail.com>	<20150107175105.74634f8c@free-electrons.com>	<54AE5090.5040802@gmail.com>
 <20150108105629.2d8308bc@free-electrons.com>
Message-ID: <54AE5AF0.1040008@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/08/2015 10:56 AM, Thomas Petazzoni wrote:
> Dear Zoltan Gyarmati,
> 
> On Thu, 08 Jan 2015 10:40:32 +0100, Zoltan Gyarmati wrote:
> 
>> i got some time to look into this:
>> my system has the file /usr/include/linux/soundcard.h , but that doesn't
>> have the missing definitions. On the other hand there is an
>> /usr/include/linux/soundcard.h.oss3 which has them...
>> Consequently the build error itself clearly not Buildroot specific.
> 
> You have the oss4-dev package installed, right?

Yes, and the files of the package:
$dpkg -L oss4-dev
/.
/usr
/usr/include
/usr/include/linux
/usr/include/linux/soundcard.h
package diverts others to: /usr/include/linux/soundcard.h.oss3
/usr/share
/usr/share/doc
/usr/share/doc/oss4-dev
/usr/share/doc/oss4-dev/copyright
/usr/share/doc/oss4-dev/changelog.gz
/usr/share/doc/oss4-dev/changelog.Debian.gz
/usr/share/doc/oss4-dev/README.Debian

I didn't notice before that the header file in question was diverted, so
after removing the package, host-python builds properly, thanks for the
hint!

> 
>>  I created a small patchset though to make the ossaudiodev module
>> optional (like ssl, zlib, etc), and disable it for the host-python
>> build. Should i submit it?
> 
> Yes, please.
Will do


> 
> Thomas
> 

-- 
Bests,
Zoltan Gyarmati
IRC freenode: zgyarmati

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150108/851b6d25/attachment.asc>
