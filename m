From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 23:14:54 +0100
Subject: [Buildroot] [PATCH 1/1] Add support to set the default port for
	dropbear to listen on
In-Reply-To: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
 (jeroen de wachter's message of "Fri, 22 Nov 2013 19:10:19 +0100
 (CET)")
References: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
Message-ID: <87r4a8nkwx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jeroen" == jeroen de wachter <jeroen.de.wachter@telenet.be> writes:

Hi Jeroen,

 > A menu entry has been added to set the port. This menu entry
 > is processed like entries that were already present and will
 > rewrite one line of the options.h file that is used by
 > dropbear during compilation.

Thanks for the patch, but I'm afraid I agree with Arnout and Yann. The
difference between this option and the others is that there's a runtime
command line option to set the port (-p), whereas that isn't the case
for the others.

Please have a look at changing this with a post build script instead. If
we want to do something to make it a bit easier, then we could change
the init script to source /etc/default/dropbear if available and let if
define E.G. ARGS that we could add to the start-stop-command invocation
-E.G. how we do in S81named for the bind package.

-- 
Bye, Peter Korsgaard
