From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jul 2014 16:44:37 -0300
Subject: [Buildroot] [PATCH 2/7 v3] package/dropbear: Add separate
 configuration option for dropbear server
In-Reply-To: <1402982507.184682.35787456543.2.gpush@pablo>
References: <1402982507.184682.35787456543.2.gpush@pablo>
Message-ID: <53C827A5.6030609@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/17/2014 02:21 AM, Jeremy Kerr wrote:

> Currently, the dropbear package installs both client and server
> components. This means that when we only want the client binaries, we
> also get the server, which is run from init.
> 
> Even though it's a multi-call binary (the client and server
> exist in the same executable), we can define which parts are
> compiled-in. We'd also like to selectively install the links and init
> scripts.
> 
> This change introduces a separate configuration for the dropbear server.

Hi.
This can be disabled in a post build script by removing the initscript
directly.
If it were a build option that saves space in the target i'd say yay,
but it's not.
And it's a slippery rope since the same could be said/done to countless
other packages that have client-server functionality like openssh,
netsnmp, openvpn and so on.
Others might disagree with me of course.
Regards.
