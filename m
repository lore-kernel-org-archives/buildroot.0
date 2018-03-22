From: Jaap Crezee <jaap@jcz.nl>
Date: Thu, 22 Mar 2018 11:43:36 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
In-Reply-To: <20180321214436.GA2085@scaer>
References: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
 <20180319213240.GA340@scaer> <86fb507f-1fa7-8355-6ec6-7b346e6945e7@jcz.nl>
 <20180321214436.GA2085@scaer>
Message-ID: <5ffd29df-7b21-122a-2d50-03fc86f29224@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 03/21/18 22:44, Yann E. MORIN wrote:
> If you change your LC_ALL et al to an UTF-8 locale, it will work again,
> I believe.

That is not working for me:

/bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)
/bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)
/bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)
/bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)
/bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)
>>>   Finalizing target directory
# Check files that are touched by more than one package
/bin/sh: warning: setlocale: LC_ALL: cannot change locale (UTF-8)
./support/scripts/check-uniq-files -t target /data/work/jcz/git/jidiot/clients/innr/buildroot_development/output/build/packages-file-list.txt
Traceback (most recent call last):
  File "./support/scripts/check-uniq-files", line 42, in <module>
    sys.exit(main())
  File "./support/scripts/check-uniq-files", line 31, in main
    for row in r:
  File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte


BTW my LANG is set to "C".

> No, because we don't always have a host-python that is built. Besides,
> python is a requirement for Buildroot, see the manual:
>     https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

Okay, clear.

regards,


Jaap
