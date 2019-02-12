From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 19:59:30 +0100
Subject: [Buildroot] [PATCH] openssh: add upstream security fixes
In-Reply-To: <e1774654a595fcb3fe74a9a1dcb81cda3cc28035.1549973584.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Feb 2019 14:13:04 +0200")
References: <e1774654a595fcb3fe74a9a1dcb81cda3cc28035.1549973584.git.baruch@tkos.co.il>
Message-ID: <87va1ovnn1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2019-6109: Due to missing character encoding in the progress
 > display, a malicious server (or Man-in-The-Middle attacker) can employ
 > crafted object names to manipulate the client output, e.g., by using
 > ANSI control codes to hide additional files being transferred. This
 > affects refresh_progress_meter() in progressmeter.c.

 > CVE-2019-6111: Due to the scp implementation being derived from 1983
 > rcp, the server chooses which files/directories are sent to the client.
 > However, the scp client only performs cursory validation of the object
 > name returned (only directory traversal attacks are prevented). A
 > malicious scp server (or Man-in-The-Middle attacker) can overwrite
 > arbitrary files in the scp client target directory. If recursive
 > operation (-r) is performed, the server can manipulate subdirectories as
 > well (for example, to overwrite the .ssh/authorized_keys file).

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Committed, thanks.

-- 
Bye, Peter Korsgaard
