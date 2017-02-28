From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Tue, 28 Feb 2017 13:55:42 +0100
Subject: [Buildroot] [PATCH] classpath: only allow on supported
 architectures
In-Reply-To: <65126b15-56dc-b768-0e4b-cbec92708e0d@cartelsol.com>
References: <1488233771-5322-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <65126b15-56dc-b768-0e4b-cbec92708e0d@cartelsol.com>
Message-ID: <2e2ab7ec-79ee-f0f6-e097-8878c9935a39@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28.02.2017 12:13, Marcus Hoffmann wrote:
> Hello Thomas,
> 
> On 27.02.2017 23:16, Thomas Petazzoni wrote:
>> --- a/package/classpath/Config.in
>> +++ b/package/classpath/Config.in
>> @@ -1,7 +1,15 @@
>> +config BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
>> +	bool
>> +	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k \
>> +		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
>> +		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le \
>> +		|| BR2_sh || BR2_x86_64
> 
> I just tested with the test-pkg script and I also get successful sparc
> and sparc64 builds. Any particular reason to not enable it there?
> 
> I'll also test again if there is any change for the bumped 0.99 version.

No change there.

Marcus
