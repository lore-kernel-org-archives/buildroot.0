From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:58:39 +0200
Subject: [Buildroot] [PATCH 1/1] nginx (S50nginx): Fix stop, reload,
	restart.  Add force-reload.
In-Reply-To: <20170925132029.17356-1-thomas.claveirole@green-communications.fr>
 (Thomas Claveirole's message of "Mon, 25 Sep 2017 15:20:29 +0200")
References: <20170925132029.17356-1-thomas.claveirole@green-communications.fr>
Message-ID: <87o9p6m9q8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Claveirole <thomas.claveirole@green-communications.fr> writes:

 > Fix package/nginx/S50nginx:
 > * On stop, use start-stop-daemon -R 1 to wait for the nginx processes
 >   to actually stop.  This fixes a race condition with restart, where
 >   nginx fails to restart because start is called too early
 >   w.r.t. stop.  (This only works with Debian's start-stop-daemon,
 >   however BusyBox's start-stop-daemon does not fail when given -R; it
 >   just ignores the argument silently).

 > * Implement reload with an actual reload instead of a restart.

 > * Add force-reload.

 > Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
