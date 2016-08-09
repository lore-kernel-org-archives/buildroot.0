From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Aug 2016 13:57:11 -0700
Subject: [Buildroot] [PATCH 1/1] package/libsidplay2: broken with gcc6
In-Reply-To: <c7qp7dxll8.ln2@ID-313208.user.individual.net>
References: <1470771855-12987-1-git-send-email-bernd.kuhls@t-online.de>
 <B397AE0E-28F2-4D0D-866B-3FD929EFB1DC@gmail.com>
 <20160809220419.36e61b43@free-electrons.com>
 <c7qp7dxll8.ln2@ID-313208.user.individual.net>
Message-ID: <80638634-9A48-44DF-91B5-C4402C20830E@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 9, 2016, at 1:15 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
> Am Tue, 09 Aug 2016 22:04:19 +0200 schrieb Thomas Petazzoni:
> 
>> Hello,
>> 
>> On Tue, 9 Aug 2016 12:52:29 -0700, Khem Raj wrote:
> 
>>> This could also be fixed in code instead to statically typecast to int8_t.
>> 
>> I would also very much prefer to see the code being fixed, rather than
>> this weird !AT_LEAST_GCC_6 dependency being added.
> 
> Hi Thomas,
> 
> ok, but I am unable to provide such a patch because I
> do not know what to code to fix the C stuff ;)
> 

perhaps changing https://sourceforge.net/p/sidplay2/code/HEAD/tree/trunk/libsidplay/src/xsid/xsid.cpp#l118
to be a char array instead of uint8_t would help ?

> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160809/d99fee2f/attachment.asc>
