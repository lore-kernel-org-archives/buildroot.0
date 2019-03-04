From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 22:32:37 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/systemd: fix "Timed out
 waiting for device /dev/console."
In-Reply-To: <20190304192547.23954-1-xruppen@gmail.com> (Xavier Ruppen's
 message of "Mon, 4 Mar 2019 20:25:47 +0100")
References: <20190304192547.23954-1-xruppen@gmail.com>
Message-ID: <871s3miave.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Xavier" == Xavier Ruppen <xruppen@gmail.com> writes:

 > Buildroot built with systemd fails to open a login prompt on the
 > serial port when /dev/console is specified as BR2_TARGET_GENERIC_GETTY_PORT
 > (which is its default value):

 > systemd[1]: dev-console.device: Job dev-console.device/start timed out.
 > systemd[1]: Timed out waiting for device /dev/console.
 > systemd[1]: Dependency failed for Serial Getty on console.
 > systemd[1]: serial-getty at console.service: Job serial-getty at console.service/start failed with result 'dependency'.
 > systemd[1]: dev-console.device: Job dev-console.device/start failed with result 'timeout'.
 > systemd[1]: Reached target Login Prompts.
 > systemd[1]: Reached target Multi-User System.

 > According to this issue on Github [1], serial-getty at .service should
 > not be instantiated on /dev/console, console-getty at .service should
 > be used instead. This stems from the fact that there should be no
 > dependency on /dev/console.

 > [1] https://github.com/systemd/systemd/issues/10914

 > Signed-off-by: Xavier Ruppen <xruppen@gmail.com>

Committed after adding the cleanups as suggested by Yann, thanks.

-- 
Bye, Peter Korsgaard
