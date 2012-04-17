From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 17 Apr 2012 19:08:53 +0200
Subject: [Buildroot] util-linux builds and installs lots of unwanted
 binaries
In-Reply-To: <e75db664abe7bb6fc8133d5f41c18f63@zacarias.com.ar>
References: <1334589472.13607.15.camel@sven>
 <51a409d383cc64319b438fc9b37c8807@zacarias.com.ar>
 <1334651710.2527.5.camel@sven>
 <e75db664abe7bb6fc8133d5f41c18f63@zacarias.com.ar>
Message-ID: <1334682533.8917.2.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2012-04-17 at 08:08 -0300, Gustavo Zacarias wrote:

> Yes, i should make the other options depend on UTIL_LINUX_BASIC.
> However there's a choice in front regarding UTIL_LINUX_BASIC - with all 
> the util-linux options disabled and this one enabled you still get 
> binary stuff installed because they're, well, basic utilities always 
> built by util-linux.
> So the option would be to keep the basic option as is or add more 
> granular options for all those other tiny utilities described in the 
> help and remove/keep them in a post hook.
> I'd rather go for the second option since not many people will want 
> mkfs.bfs, mkfs.minix and those utilities most of the time, even when 
> installing others.

Adding an option for each and every utility would probably be too much.
But we could introduce options for each of the sub-directories in
util-linux (disk-utils, misc-utils, etc). Then one could use 'make -D
(subdir) install' to install all the utilities from a sub-directory.


Regards,
Sven
