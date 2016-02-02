From: Eelco Chaudron <echaudron@xiot.nl>
Date: Tue, 2 Feb 2016 21:49:35 +0100
Subject: [Buildroot] Problem with python packages in .zip format
Message-ID: <F9CA10A6-C5B6-4D4D-B38A-829D1D422751@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Before I start investigating I was wondering if some one has seen this before?
If the python packages is in .zip it does not seem to know how to extract and thinks it a binary.
See the following:

$ make python-flask-wtf
>>> python-wtforms 2.1 Downloading
--2016-02-02 21:45:45--  https://pypi.python.org/packages/source/W/WTForms/WTForms-2.1.zip
Resolving pypi.python.org (pypi.python.org)... 23.235.43.223
Connecting to pypi.python.org (pypi.python.org)|23.235.43.223|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 553644 (541K) [application/octet-stream]
Saving to: ?/home/echaudron/buildroot/output/build/.WTForms-2.1.zip.3oIKIZ/output?

/home/echaudron/buildroot/output/build/.WTForms-2.1.zip.3oIKI 100%[==================================================================================================================================================================================>] 540.67K  3.42MB/s   in 0.2s   

2016-02-02 21:45:45 (3.42 MB/s) - ?/home/echaudron/buildroot/output/build/.WTForms-2.1.zip.3oIKIZ/output? saved [553644/553644]

WTForms-2.1.zip: OK (md5: 6938a541fafd1a1ae2f6b9b88588eef2)
WTForms-2.1.zip: OK (sha256: ffdf10bd1fa565b8233380cb77a304cd36fd55c73023e91d4b803c96bc11d46f)
>>> python-wtforms 2.1 Extracting
/home/echaudron/buildroot/dl/WTForms-2.1.zip | tar --strip-components=1 -C /home/echaudron/buildroot/output/build/python-wtforms-2.1   -xf -
/bin/bash: /home/echaudron/buildroot/dl/WTForms-2.1.zip: Permission denied
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
package/pkg-generic.mk:128: recipe for target '/home/echaudron/buildroot/output/build/python-wtforms-2.1/.stamp_extracted' failed
make[1]: *** [/home/echaudron/buildroot/output/build/python-wtforms-2.1/.stamp_extracted] Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

Thanks,

Eelco

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160202/dadfe7b7/attachment.html>
