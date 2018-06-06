From: Jaap Crezee <jaap@jcz.nl>
Date: Wed, 6 Jun 2018 17:29:57 +0200
Subject: [Buildroot] scanpypi tool python error - local variable 'download'
 referenced before assignment
Message-ID: <55bf291b-22cf-b254-d04c-e7bf017f85be@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Is this a known issue?

[jaap at jaap /data/work/htc/git/buildroot_development ]$ git log -1
commit f3d114a1effd8a6ef773bee14fe49ea6d8d7c350 (HEAD, tag: 2018.05)
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Jun 1 22:22:57 2018 +0200

    Update for 2018.05

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[jaap at jaap /data/work/htc/git/buildroot_development ]$ ./utils/scanpypi azure-iothub-device-client
buildroot package name for azure-iothub-device-client: python-azure-iothub-device-client
Package: python-azure-iothub-device-client
Fetching package azure-iothub-device-client
Traceback (most recent call last):
  File "./utils/scanpypi", line 716, in <module>
    main()
  File "./utils/scanpypi", line 648, in main
    package.download_package()
  File "./utils/scanpypi", line 217, in download_package
    if download.__class__ == six.moves.urllib.error.HTTPError:
UnboundLocalError: local variable 'download' referenced before assignment
[jaap at jaap /data/work/htc/git/buildroot_development ]$

regards,


Jaap
