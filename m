From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Oct 2017 11:45:44 +0000
Subject: [Buildroot] [Bug 10451] libpcap 1.8.x and 1.7x does not compile on
	PPC
In-Reply-To: <bug-10451-163@https.bugs.busybox.net/>
References: <bug-10451-163@https.bugs.busybox.net/>
Message-ID: <bug-10451-163-GlUgLPKCgH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10451

--- Comment #2 from Karl Krach <mail@kkrach.de> ---
The compiler error is:


output/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -fvisibility=hidden -fpic
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe
-mfloat-gprs=double -Wa,-me500x2 -O3  -I. 
-I/home/kkr/Projects/aseries-axos-c2m/system/buildroot-2017.08/output/host/powerpc-buildroot-linux-uclibcspe/sysroot/usr/include/dbus-1.0
-I/home/kkr/Projects/aseries-axos-c2m/system/buildroot-2017.08/output/host/powerpc-buildroot-linux-uclibcspe/sysroot/usr/lib/dbus-1.0/include
  -DBUILDING_PCAP -DHAVE_CONFIG_H  -D_U_="__attribute__((unused))"
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe
-mfloat-gprs=double -Wa,-me500x2 -O3 -c ./pcap.c

./pcap.c: In function 'pcap_create_common':
./pcap.c:590:1: error: unrecognizable insn:
 }
 ^
(insn 58 57 59 9 (set (subreg:SI (reg:V2SI 181) 0)
        (unspec:SI [
                (symbol_ref:SI ("pcap_cant_set_rfmon") [flags 0x3]
<function_decl 0x7eff366c4c00 pcap_cant_set_rfmon>)
                (reg:SI 30 30)
            ] UNSPEC_MOVSI_GOT)) "./pcap.c":570 -1
     (nil))
./pcap.c:590:1: internal compiler error: in extract_insn, at recog.c:2311

-- 
You are receiving this mail because:
You are on the CC list for the bug.
