From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 10:18:30 +0200
Subject: [Buildroot] [PATCH] package/alsa-utils: fix install if
 directories exist
In-Reply-To: <20200903133533.2505458-1-john@metanate.com> (John Keeping's
 message of "Thu, 3 Sep 2020 14:35:33 +0100")
References: <20200903133533.2505458-1-john@metanate.com>
Message-ID: <874kocljqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > "mkdir" (without "-p") fails if the target directory exists, which means
 > that if alsa-utils is being reinstalled or if other files have
 > previously been installed in the alsa-state.d or alsa-restore.d
 > directories the installation will fail.

 > Switch to "$(INSTALL) -d" which allows us to be explicit about the
 > permissions and handles the case of a pre-existing directory correctly.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
