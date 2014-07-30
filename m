From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 19:06:38 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.10
In-Reply-To: <20140730235820.3f3275d2@free-electrons.com>
References: <1406657724-21261-1-git-send-email-gustavo@zacarias.com.ar>	<20140729202202.6ca3c3f3@free-electrons.com>	<53D7EDCD.8040402@zacarias.com.ar>
 <20140730235820.3f3275d2@free-electrons.com>
Message-ID: <53D96C6E.5060203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/30/2014 06:58 PM, Thomas Petazzoni wrote:

> But those tools are installed in /usr/lib ? The target-finalize logic
> to remove .py files only applies to /usr/lib, not to the entire root
> filesystem.

The binaries are installed in /usr/bin & /usr/sbin, but they are python
scripts that import from the usual /usr/lib/python2.7/site-packages/* (a
couple in the toplevel, most in samba/).
Alternatively we can remove the tools if .pyc files aren't kept or hide
samba4.
But since that doesn't inhibit samba4 working and most people would
probably make up their config from some template or separate web ui i
went for the warning.
It would probably be problematic for advanced uses like clustering or
ADS support which aren't part of the feature set of the package at the
moment (and stumbled upon it when testing what that would entail).
Regards.
