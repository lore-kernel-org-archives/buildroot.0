From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 26 Sep 2017 22:05:13 +0200
Subject: [Buildroot] [PATCH 1/1] nginx (S50nginx): Fix stop, reload,
	restart. Add force-reload.
In-Reply-To: <20170925132029.17356-1-thomas.claveirole@green-communications.fr>
References: <20170925132029.17356-1-thomas.claveirole@green-communications.fr>
Message-ID: <CAHXCMM+79rxMy95Hg7X7CgesQXihZK553pJxq=rm4LFL0TVsWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 25, 2017 at 3:20 PM, Thomas Claveirole
<thomas.claveirole@green-communications.fr> wrote:
> Fix package/nginx/S50nginx:
>
> * On stop, use start-stop-daemon -R 1 to wait for the nginx processes
>   to actually stop.  This fixes a race condition with restart, where
>   nginx fails to restart because start is called too early
>   w.r.t. stop.  (This only works with Debian's start-stop-daemon,
>   however BusyBox's start-stop-daemon does not fail when given -R; it
>   just ignores the argument silently).
>
> * Implement reload with an actual reload instead of a restart.
>
> * Add force-reload.
>
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
