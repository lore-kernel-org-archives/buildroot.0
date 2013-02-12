From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 16:29:22 +0100
Subject: [Buildroot] [PATCH v2] Python 3, simple,
 external package support
In-Reply-To: <511A5DD5.1030005@yahoo.fr>
References: <1360678441-3199-1-git-send-email-kpa_info@yahoo.fr>
 <20130212152155.0d3c5301@skate> <511A54EE.5010509@yahoo.fr>
 <20130212155333.1cf75e26@skate> <511A5DD5.1030005@yahoo.fr>
Message-ID: <20130212162922.7e940756@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick,

On Tue, 12 Feb 2013 16:20:53 +0100, Patrick wrote:

> Thomas, I am aware that there is others packages that depends on 
> host-python, mostly x11. But I have not changed the way host-python nor 
> host-python3 are build and used. I don't understand how the changes I 
> have made could break this compared as previously ? If I'm not mistaken, 
> host-python is selected directly by the package (mesa3d for example) 
> when needed, and this is independent of the selected python package, right ?

True.

So we might end up with two versions of Python installed in
$(HOST_DIR): python2 and python3. Hopefully, it should work.

Regarding the patch set, I think I would prefer to rename the current
python package to python2, and have the 'python' package be the virtual
package that provides either python2 or python3. That's indeed more
work, but I find the name "python-generic" not so great.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
