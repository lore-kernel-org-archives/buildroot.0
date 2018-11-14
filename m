From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:36:25 +0100
Subject: [Buildroot] [PATCH v2] scanpypi: use archive file name to
 specify the extraction folder
In-Reply-To: <20181102134501.13860-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Fri, 2 Nov 2018 14:45:01
 +0100")
References: <20181102134501.13860-1-yegorslists@googlemail.com>
Message-ID: <87o9arthg6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Some packages have archive name that is different from package name.
 > For example websocket-client's archive name is websocket_client-*.tar.gz.
 > scanpypi expects the temporary extract folder to be:

 > /tmp-folder/BR-package-name/PyPI-packagename-and-version

 > In the case of websocket-client package the real extraction folder
 > will be different from the expected one because of the '_' in the
 > archive file name.

 > Use archive file name instead of package name to specify the extraction
 > folder. As the version is already part of this file, we don't need to
 > specify it.

 > Bonus: remove obsolete "return None, None" as the function doesn't return
 > anything. OSError class doesn't provide "message" member, so replace it
 > with "strerror".

 > Fixes:
 > https://bugs.busybox.net/show_bug.cgi?id=11251

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes v1->v2:
 > 	- fix typos
 > 	- add fixes tag

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
