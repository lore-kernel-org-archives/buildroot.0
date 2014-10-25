From: =?UTF-8?Q?J=C3=B6rg_Krause?= <jkrause@posteo.de>
Date: Sat, 25 Oct 2014 15:41:02 +0200
Subject: [Buildroot] [PATCH v2 1/1] shairplay-sync: new package
In-Reply-To: <20141025122921.0ad0652e@free-electrons.com>
References: <1414191341-21557-1-git-send-email-jkrause@posteo.de>
 <20141025122921.0ad0652e@free-electrons.com>
Message-ID: <56aabaa3604876fb38ac9833169f1b88@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Am 25.10.2014 12:29 schrieb Thomas Petazzoni:
> Dear J?rg Krause,
> 
> On Sat, 25 Oct 2014 00:55:41 +0200, J?rg Krause wrote:
>> Signed-off-by: J?rg Krause <jkrause@posteo.de>
>> ---
>> Changes v1 -> v2:
>>   - autoselect SSL backend instead of a user choice
>>   - autoselect zeroconf backend instead of a user choice
>>   - fix missing select for optional package libsoxr
>>   - fix config option for avahi (--with-avahi instead of 
>> --with-openssl)
>>   - add comment to tinysvcmdns in shairport-sync.mk
> 
> Applied, after doing a few tweaks:
> 
>     [Thomas:
>      - rework init script to be more like other Buildroot init scripts,
>        and fix indentation.
>      - fix indentation in the .mk file
>      - remove dependencies on host-autoconf and host-libtool, since the
>        package has AUTORECONF = YES, this is not needed.
>      - fix licensing informations.]


Many thanks for the thorough review! You even checked the license!

One question to the init script file: shairport-sync uses libdaemon for 
creating the pidfile. Does this conflicts with the `-p` switch of 
start-stop-daemon?

Best regards
J?rg
