From: Jaap Crezee <jaap@jcz.nl>
Date: Mon, 19 Mar 2018 21:45:22 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
Message-ID: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,


Anybody familiar with the following problem?

>>>   Finalizing target directory
# Check files that are touched by more than one package
./support/scripts/check-uniq-files -t target /data/work/jcz/git/jidiot/clients/innr/buildroot/output/build/packages-file-list.txt
Traceback (most recent call last):
  File "./support/scripts/check-uniq-files", line 42, in <module>
    sys.exit(main())
  File "./support/scripts/check-uniq-files", line 31, in main
    for row in r:
  File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc5 in position 6473: ordinal not in range(128)
make: *** [Makefile:699: target-finalize] Error 1


Running on 8a94ff12d232ada68cff5957089a78a1f0b8f192 / 2018.02.x

regards,


Jaap Crezee
