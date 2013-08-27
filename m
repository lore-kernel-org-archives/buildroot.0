From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 27 Aug 2013 08:41:16 +0100
Subject: [Buildroot] [RFC] uclibc: reinstate support for version 0.9.31
In-Reply-To: <20130826163209.71188312@skate>
References: <1376997241-20991-1-git-send-email-spdawson@gmail.com>
 <20130826163209.71188312@skate>
Message-ID: <CAHt8ZCN7zEKhx3znac2=1Nha2z1Gi6vK9MrihVC2Dc=80OU_Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback Thomas.

On 26 August 2013 15:32, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> You said:
>
> ""unfortunately,
> while uClibc 0.9.33.x does build for avr32, the result is a root
> filesystem with unusably-slow runtime performance.
> ""
>
> Then maybe we should make 0.9.31 the only possible uClibc version for
> AVR32 ?

Yes, I think that would be a good idea. Should that be done in a separate patch?

>> diff --git a/package/connman/Config.in b/package/connman/Config.in
>> index 0853941..22f3b9f 100644
>> --- a/package/connman/Config.in
>> +++ b/package/connman/Config.in
>> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CONNMAN
>>       select BR2_PACKAGE_LIBGLIB2
>>       select BR2_PACKAGE_IPTABLES
>>       select BR2_PACKAGE_GNUTLS
>> -     depends on !BR2_UCLIBC_VERSION_0_9_32
>> +     depends on !(BR2_UCLIBC_VERSION_0_9_31 || BR2_UCLIBC_VERSION_0_9_32)
>
> Maybe it was inotify that was missing, but I see you've backported the
> inotify support in 0.9.31. Or it was something else than inotify?

I don't quite follow your meaning here... Are you referring to the
connman package specifically?

Simon.
