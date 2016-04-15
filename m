From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 20:24:38 +0200
Subject: [Buildroot] [PATCH 2/2] gdk-pixbuf: use host loaders to update
	the cache
In-Reply-To: <1459899084-23473-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 5 Apr 2016 20:31:24 -0300")
References: <1459899084-23473-1-git-send-email-gustavo@zacarias.com.ar>
 <1459899084-23473-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bn5ahgrd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Unfortunately gdk-pixbuf-query-loaders doesn't understand cross loaders
 > to update the cache, hence we can't use the host variant against target
 > loaders since it will output an effectively empty cache, causing runtime
 > failure of libgtk when finding icons.
 > So make host-gdk-pixbuf functionally equivalent to the target gdk-pixbuf
 > so we can run gdk-pixbuf-query-loaders against the host plugins and just
 > strip the host directory to make it runtime-compatible (like was done
 > before for the target directory).

 > This is still better than trying to update at runtime, since that would
 > require a writable loaders.cache file in tmpfs or rw filesystem, not to
 > mention the associated additional startup time.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
