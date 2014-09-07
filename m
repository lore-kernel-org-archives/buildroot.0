From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 Sep 2014 10:01:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] nios2 build results for
	2014-09-05
References: <20140906063010.F1253101275@stock.ovh.net>
 <CAAEAJfD4eNUAZF9bNV+tWNghFw-pe5qmeAJoZuzMsbASZuAuVg@mail.gmail.com>
 <XnsA3A0AF1AE9B38berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <CAAEAJfAeQhe93q7qZFTP=rbZqTfhqQ5FrcXK9ATGzPAoj8sX0w@mail.gmail.com>
Message-ID: <XnsA3A165E7BFABDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> 
wrote in 
news:CAAEAJfAeQhe93q7qZFTP=rbZqTfhqQ5FrcXK9ATGzPAoj8sX0w at mail.gmail.com:

> On 6 September 2014 12:12, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> wrote in news:CAAEAJfD4eNUAZF9bNV+tWNghFw-
>> pe5qmeAJoZuzMsbASZuAuVg at mail.gmail.com:
>>
>>> Any idea why av_open_input_file and avformat_open_input is not found?
>>
>> is the current build error still related to this discussion?
>>
>> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/74623
> Well, it seems that patch you sent attempted to fix this same error.
> However, applying your patch over here didn't help.

Hi,

weird, I just tested my patch again and it still fixes the build error here:

[...]
checking for sqlite3_prepare_v2 in -lsqlite3... yes
checking for av_open_input_file in -lavformat... no
checking for avformat_open_input in -lavformat... yes
checking for av_rescale_q in -lavutil ... yes
[...]

$ file /home/buildroot/br/output/target/usr/sbin/minidlnad
/home/buildroot/br/output/target/usr/sbin/minidlnad: ELF 32-bit LSB 
executable, Altera Nios II, version 1 (SYSV), dynamically linked (uses shared 
libs), for GNU/Linux 3.12.0, not stripped

Regards, Bernd
