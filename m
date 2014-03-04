From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Mar 2014 21:14:52 -0300
Subject: [Buildroot] [RFC,
 PATCH 2/8] package/dropbear: Add separate configuration options for
 client and server
In-Reply-To: <1389862338.918265.958087681541.2.gpush@pablo>
References: <1389862338.918265.958087681541.2.gpush@pablo>
Message-ID: <53151AFC.3010402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/16/2014 05:52 AM, Jeremy Kerr wrote:

> Currently, the dropbear package installs both client and server
> components. For example, this means that when we only want the
> client binaries, we also get the server run from init.
> 
> Even though it's a multi-call binary (the client and server
> exist in the same executable), we'd like to selectively install the
> links and init scripts. This change introduces separate configuration
> options (both 'default y') for the client and server bits.

Normally we don't make initscript installation an option and since the
dropbear package options are essentially a no-op what's the point?
(if you don't want sshd to startup on boot you can use a post build
script to just remove the initscript from the target, that's the
recommended way).
Regards.
