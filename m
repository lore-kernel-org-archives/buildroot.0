From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 10 Jun 2014 11:33:37 +0200 (CEST)
Subject: [Buildroot] Some files to be copied to root file systems such
 as	openvpn keys, conf
In-Reply-To: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
Message-ID: <279642119.17500579.1402392817223.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


All file ownership are given to root in the fakeroot container,

the fakeroot container is applied after the overlay


So, (assuming I understant correctly what's going on) you don't neet to have these files owned by root in the overlay. Ownership will be changed while the final image is built
----- Mail original -----
> 
> 
> 
> Dear all,
> 
> 
> I am attempting right now to copy some files through Root overlay to
> my file system image, however, as some of them requires root
> permission I cannot copy them to the related place. For instance,
> openvpn files such as server.key, ta.keys, etc raise the following
> issue:
> 
> 
> 
> cp: cannot access
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/easy-rsa/2.0/keys?:
> Permission denied
> cp: cannot access
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/easy-rsa/2.0/keys?:
> Permission denied
> cp: cannot open
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/server.conf?
> for reading: Permission denied
> cp: cannot open
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/server.key?
> for reading: Permission denied
> cp: cannot open
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/samples/client.conf?
> for reading: Permission denied
> cp: cannot open
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/openvpn/ta.key?
> for reading: Permission denied
> cp: cannot open
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/server.key?
> for reading: Permission denied
> cp: cannot open
> ?/home/cem/buildroot/board/myboard/root-additions/etc/openvpn/samples/client.conf?
> for reading: Permission denied
> 
> 
> The script that I have written in post-build.sh as below:
> 
> 
> 
> fakeroot cp -r $BOARD_DIR/root-additions/etc/openvpn $TARGET_DIR/etc/
> fakeroot cp -r $BOARD_DIR/root-additions/etc/snmp $TARGET_DIR/etc/
> 
> 
> 
> 
> Obviously, there is a permission issue, but I have no idea how to
> handle it. it seems that sudo doesn't work, since buildroot uses
> fakeroot.
> 
> 
> Thanks
> Cem
> 
> 
> 
> 
> 
> Cem Akpolat
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
