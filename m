From: Cristi Magherusan <Cristi.Magherusan@net.utcluj.ro>
Date: Mon, 15 Jun 2009 23:29:35 +0300
Subject: [Buildroot] [Patch] OpenVZ tools
Message-ID: <1245097775.15517.30.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
        
The attached patch creates a Virtualization item in the configuration
menu, adds support for the OpenVZ tools vzctl and vzquota, adds
the /dev/vzctl device in the device list file(commented out by default),
and fixes the kernel patching procedure that caused compilation failures
when applying the OpenVZ patches. 

For anyone who wants to test this:
In order to get it work for real, you need to compile a kernel patched
with OpenVZ support. I can provide a .config file with patches built-in
if asked.

By the way, wouldn't it be nicer to have a devlists.sh file which would
contain "if" clauses in order to create devices according to the
configuration, and the file could be executed to create the real devlist
file. This way we could ensure the device needed by a tool is there, and
missing when the tool is not compiled.

For example, devlist.sh could contain:
if $(BR2_PACKAGE_VZCTL) then
echo "/dev/vzctl    c       600     0       0       126     0       0       0       -"
fi

And we could run "sh devlist.sh > devlist.txt" in order to create the
real devlist file. 


Regards,
Cristi


Signed-off by: Cristi Magherusan <cristi.magherusan@net.utcluj.ro>

-- 
Ing. Cristi M?gheru?an, System/Network Engineer
Technical University of Cluj-Napoca, Romania
http://cc.utcluj.ro  +40264 401247
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-openvz.patch
Type: text/x-patch
Size: 5118 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090615/5d4d408e/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090615/5d4d408e/attachment.pgp>
