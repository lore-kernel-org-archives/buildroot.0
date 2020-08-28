From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 22:36:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender: Fix incorrectly named
 service file
In-Reply-To: <20200828170844.412507-1-aduskett@gmail.com> (aduskett's message
 of "Fri, 28 Aug 2020 10:08:44 -0700")
References: <20200828170844.412507-1-aduskett@gmail.com>
Message-ID: <87wo1ild7q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Many of the mender CLI commands use systemctl commands to get information about
 > the daemon, such as the PID (IE: systemctl show -p MainPID mender-client).
 > As seen above, these commands expect the service file to be named
 > "mender-client" instead of "mender."

 > As such, in the current state, running a forced update check in the CLI will
 > result in the following error:
 > failed to force updateCheck: could not find the PID of the mender daemon.

 > Changing the name of mender.service to mender-client.service fixes the issue.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
