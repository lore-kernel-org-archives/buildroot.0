From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 17 Jan 2008 17:37:44 +1100
Subject: [Buildroot] [PATCH] python enhancements
Message-ID: <20080117063744.GA1661@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here are some enhancements for the python package.

1. Currently it strips .pyc (compiled python modules) from the build.
Instead, I added the option to strip the .py files instead, or keep
both. It's much quicker to load from the .pyc files and you often don't
even need the .py sources.

2. Currently a bunch of modules are disabled because they need extra
modules (openssl, readline, ncurses etc). I added configuration options
to enable them.

3. I also added an option to disable some of the larger compiled modules
(> 100k each) which are not used much.



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-python.patch
Type: text/x-diff
Size: 5552 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080117/5e6a6c00/attachment.bin 
