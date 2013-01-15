From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 14 Jan 2013 21:43:31 -0800
Subject: [Buildroot] How do I start nfsd
In-Reply-To: <CAJJ6jxsvO2bN4Zb-uW4pVP129r1ovDdisXFqbYdGv2AOvwTpCg@mail.gmail.com>
References: <CAJJ6jxsvO2bN4Zb-uW4pVP129r1ovDdisXFqbYdGv2AOvwTpCg@mail.gmail.com>
Message-ID: <CAJJ6jxuHVz1CpGzPvXcFOadvi+Fr3VOebUBtnkw1yeHxyidjdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 11, 2013 at 8:54 PM, Steve Calfee <stevecalfee@gmail.com> wrote:
> I have an embedded system (Dockstar) where I want to start a nfs
> server. Google insists on telling me how to boot from nfs.
>
> I have selected the nfs utils, and selected nfs in Linux. However, I
> can't get nfs to start up on the target. Has anyone got a url which
> demonstrates how to setup the target to get nfs going.
>

Replying to myself...

Has anyone gotten nfsd to work in buildroot? I am using the 2012.11
release. I have the nfs boot working fine. I mount a usb drive and try
to export it as a nfs mountable drive. I am getting errors and would
like to see a working kernel/buildroot config.

Maybe some interesting console text:

# /etc/init.d/S60nfs restart
Shutting down NFS mountd: done
Shutting down NFS daemon:
done
Shutting down NFS services: done
Stopping NFS statd: done
Starting NFS statd: done
Starting NFS services: done
Starting NFS daemon: svc: failed to register nfsdv2 RPC service (errno 111).
nfsd: last server has exited, flushing export cache
rpc.nfsd: writing fd to kernel failed: errno 111 (Connection refused)
rpc.nfsd: unable to set any sockets for nfsd
done
Starting NFS mountd: Cannot register service: RPC: Unable to receive; errno = Co
nnection refused
done
# cat /etc/exports
# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
/mnt/ 192.168.2.1/24(rw,no_root_squash,no_subtree_check,sync)

Thanks, Steve
