From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 15:23:59 +0200
Subject: [Buildroot] Fwd: all files and folders seem as an executable
 file ?
In-Reply-To: <CAMm5Yqrn7psH2jRb2Uh1u30ni4iQdNMDSUy1=U3vHz5tu+sRTA@mail.gmail.com>
References: <CAMm5YqrU4Vk9KJpVVPoYrNL-wNeVXEPVu3GdSLTNe2gYHc=ZMw@mail.gmail.com>
 <20140526135034.74637680@free-electrons.com>
 <CAMm5YqqX4pKA5Exxser2OSWfsUX9sHp2Tjsump2cW65JHktHeA@mail.gmail.com>
 <CAMm5Yqrn7psH2jRb2Uh1u30ni4iQdNMDSUy1=U3vHz5tu+sRTA@mail.gmail.com>
Message-ID: <20140526152359.3918fd4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear cem akpolat,

On Mon, 26 May 2014 13:59:50 +0200, cem akpolat wrote:

> in the generated file system I am seeing that all files/folders are
> executable. In terms of format, if you mean the file system format, this is
> .cpio. Would it be possible due to the fact that I pack out the file system
> via root permission and then re-pack again with root-permission (I haven't
> started to use root_overlay).

Maybe the way you unpack/repack is incorrect. Can you check just
unpacking the .cpio ? I'm using the cpio filesystem format everyday,
and I have correct permissions.

Also, in your separate question about SSH, you pasted the following
thing:

-rw-r--r--  1 root    root      1574 May 26 11:10 ssh_config
-rw-------  1 root    root       668 May 26 19:15 ssh_host_dsa_key
-rw-r--r--  1 root    root       590 May 26 19:15 ssh_host_dsa_key.pub
-rw-------  1 root    root       227 May 26 19:15 ssh_host_ecdsa_key
-rw-r--r--  1 root    root       162 May 26 19:15 ssh_host_ecdsa_key.pub
-rw-------  1 root    root       411 May 26 19:24 ssh_host_ed25519_key
-rw-------  1 root    root        96 May 26 19:24 ssh_host_ed25519_key.pub
-rw-------  1 root    root       965 May 26 19:15 ssh_host_key
-rw-r--r--  1 root    root       630 May 26 19:15 ssh_host_key.pub
-rw-------  1 root    root      1679 May 26 19:15 ssh_host_rsa_key
-rw-r--r--  1 root    root       382 May 26 19:15 ssh_host_rsa_key.pub
-rw-r--r--  1 root    root      3622 May 26 11:10 sshd_config

As you can see, none of these files have the executable permissions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
