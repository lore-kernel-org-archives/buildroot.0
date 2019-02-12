From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 10:20:55 +0100
Subject: [Buildroot] [PATCH 1/1] runc: bump to 6635b4f,
 fixes critical CVE-2019-5736
In-Reply-To: <20190212083818.20746-1-christian@paral.in> (Christian Stewart's
 message of "Tue, 12 Feb 2019 00:38:18 -0800")
References: <20190212083818.20746-1-christian@paral.in>
Message-ID: <87d0nxwefc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Runc has a bug and related CVE which enables code running in a container to
 > overwrite the runc binary, taking root control of the host system and escaping
 > containment. This commit upgrades Runc to fix the vulnerability.

 > Fixes: CVE-2019-5736
 > Signed-off-by: Christian Stewart <christian@paral.in>

I am working on this as well. The fix (I would prefer to just add commit
0a8e4117e7f715d as a patch for easy backport) uses fexecve, which isn't
available on uClibc, so we need to propagate that dependency to the
reverse dependencies.

I also recently added a unit test for docker / compose. This test uses a
prebuilt uClibc based toolchain, so the test needs to be updated.

-- 
Bye, Peter Korsgaard
