From: Tom <fivemiletom@gmail.com>
Date: Tue, 19 Jun 2007 02:32:13 -0700
Subject: [Buildroot] cygwin doubt
In-Reply-To: <78aeb6ba0706190156g4a335781ucca6c154928c9c3f@mail.gmail.com>
References: <78aeb6ba0706190156g4a335781ucca6c154928c9c3f@mail.gmail.com>
Message-ID: <4677A29D.4020406@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Look for this thread as a starting point: "Re: [Buildroot] mpfr error on 
cygwin for arm".

While I got far enough to get to a cross compiler on cygwin, to me it 
doesn't seem a feasible solution for all the embedded development work 
yet. Now I am thinking of letting only the embedded application 
developer build on cygwin and do the platform/kernel on a linux host. Or 
move the whole development to Virtual PC / VMWare to run linux on top of 
Windows. Anyone experience with any of these two scenarios?


ICE wrote:
> Hi
> 
> Has n e 1 successfully compiled buildroot on cygwin
> 
> I had configured buildroot for arm920t and i tried to make it it gave
> me the following dump
> 
> $ make
> if [ ! -e "/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed"
> ] ; then \
> 		mkdir -p "/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin"; \
> 		rm -f "/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed"; \
> 		ln -sf "/usr/bin/sed"
> "/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed"; \
> 	fi
> 
> Checking build system dependencies:
> CC clean:					Ok
> CXX clean:					Ok
> CPP clean:					Ok
> CFLAGS clean:					Ok
> INCLUDES clean:					Ok
> CXXFLAGS clean:					Ok
> which installed:				Ok
> sed works:					Ok (/usr/bin/sed)
> GNU make version '3.81':			Ok
> C compiler '/usr/bin/gcc'
> C compiler version '3.4.4':			Ok
> C++ compiler '/usr/bin/c++'
> C++ compiler version '3.4.4':			Ok
> bison installed:				Ok
> flex installed:					Ok
> gettext installed:				Ok
> makeinfo installed:				Ok
> Build system dependencies:			Ok
> 
> (cd /cygdrive/d/buildroot_work/buildroot/build_arm/linux-2.6.20.4 ; \
> 	 make -j1 ARCH=arm CC="gcc" \
> 		INSTALL_HDR_PATH=/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/linux
> headers_install ; \
> 	)
> make[1]: Entering directory
> `/cygdrive/d/buildroot_work/buildroot/build_arm/linux-2.6.20.4'
>   CHK     include/linux/version.h
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/basic/docproc
>   HOSTCC  scripts/unifdef
>   MKDIR   include
>   MKDIR   include/asm
>   UNIFDEF include/asm/a.out.h
>   UNIFDEF include/asm/auxvec.h
>   UNIFDEF include/asm/byteorder.h
>   UNIFDEF include/asm/elf.h
>   UNIFDEF include/asm/errno.h
>   UNIFDEF include/asm/fcntl.h
>   UNIFDEF include/asm/ioctl.h
>   UNIFDEF include/asm/ioctls.h
>   UNIFDEF include/asm/ipcbuf.h
>   UNIFDEF include/asm/mman.h
>   UNIFDEF include/asm/msgbuf.h
>   UNIFDEF include/asm/page.h
>   UNIFDEF include/asm/param.h
>   UNIFDEF include/asm/poll.h
>   UNIFDEF include/asm/posix_types.h
>   UNIFDEF include/asm/ptrace.h
>   UNIFDEF include/asm/resource.h
>   UNIFDEF include/asm/sembuf.h
>   UNIFDEF include/asm/setup.h
>   UNIFDEF include/asm/shmbuf.h
>   UNIFDEF include/asm/shmparam.h
>   UNIFDEF include/asm/sigcontext.h
>   UNIFDEF include/asm/siginfo.h
>   UNIFDEF include/asm/signal.h
>   UNIFDEF include/asm/socket.h
>   UNIFDEF include/asm/sockios.h
>   UNIFDEF include/asm/stat.h
>   UNIFDEF include/asm/statfs.h
>   UNIFDEF include/asm/termbits.h
>   UNIFDEF include/asm/termios.h
>   UNIFDEF include/asm/types.h
>   UNIFDEF include/asm/unistd.h
>   UNIFDEF include/asm/user.h
>   MKDIR   include/asm-generic
>   INSTALL include/asm-generic/errno-base.h
>   INSTALL include/asm-generic/errno.h
>   INSTALL include/asm-generic/fcntl.h
>   INSTALL include/asm-generic/ioctl.h
>   INSTALL include/asm-generic/ipc.h
>   INSTALL include/asm-generic/mman.h
>   INSTALL include/asm-generic/signal.h
>   INSTALL include/asm-generic/statfs.h
>   UNIFDEF include/asm-generic/resource.h
>   UNIFDEF include/asm-generic/siginfo.h
>   MKDIR   include/linux
>   MKDIR   include/linux/byteorder
>   INSTALL include/linux/byteorder/big_endian.h
>   INSTALL include/linux/byteorder/little_endian.h
>   INSTALL include/linux/byteorder/pdp_endian.h
>   UNIFDEF include/linux/byteorder/generic.h
>   UNIFDEF include/linux/byteorder/swab.h
>   UNIFDEF include/linux/byteorder/swabb.h
>   MKDIR   include/linux/dvb
>   INSTALL include/linux/dvb/ca.h
>   INSTALL include/linux/dvb/frontend.h
>   INSTALL include/linux/dvb/net.h
>   INSTALL include/linux/dvb/osd.h
>   INSTALL include/linux/dvb/version.h
>   UNIFDEF include/linux/dvb/audio.h
>   UNIFDEF include/linux/dvb/dmx.h
>   UNIFDEF include/linux/dvb/video.h
>   MKDIR   include/linux/hdlc
>   INSTALL include/linux/hdlc/ioctl.h
>   MKDIR   include/linux/isdn
>   INSTALL include/linux/isdn/capicmd.h
>   MKDIR   include/linux/netfilter
>   INSTALL include/linux/netfilter/nf_conntrack_sctp.h
>   INSTALL include/linux/netfilter/nf_conntrack_tuple_common.h
>   INSTALL include/linux/netfilter/nfnetlink_conntrack.h
>   INSTALL include/linux/netfilter/nfnetlink_log.h
>   INSTALL include/linux/netfilter/nfnetlink_queue.h
>   INSTALL include/linux/netfilter/xt_CLASSIFY.h
>   INSTALL include/linux/netfilter/xt_CONNMARK.h
>   INSTALL include/linux/netfilter/xt_CONNSECMARK.h
>   INSTALL include/linux/netfilter/xt_DSCP.h
>   INSTALL include/linux/netfilter/xt_MARK.h
>   INSTALL include/linux/netfilter/xt_NFLOG.h
>   INSTALL include/linux/netfilter/xt_NFQUEUE.h
>   INSTALL include/linux/netfilter/xt_SECMARK.h
>   INSTALL include/linux/netfilter/xt_comment.h
>   INSTALL include/linux/netfilter/xt_connbytes.h
>   INSTALL include/linux/netfilter/xt_conntrack.h
>   INSTALL include/linux/netfilter/xt_dccp.h
>   INSTALL include/linux/netfilter/xt_esp.h
>   INSTALL include/linux/netfilter/xt_hashlimit.h
>   INSTALL include/linux/netfilter/xt_helper.h
>   INSTALL include/linux/netfilter/xt_length.h
>   INSTALL include/linux/netfilter/xt_limit.h
>   INSTALL include/linux/netfilter/xt_mac.h
>   INSTALL include/linux/netfilter/xt_multiport.h
>   INSTALL include/linux/netfilter/xt_pkttype.h
>   INSTALL include/linux/netfilter/xt_policy.h
>   INSTALL include/linux/netfilter/xt_realm.h
>   INSTALL include/linux/netfilter/xt_sctp.h
>   INSTALL include/linux/netfilter/xt_state.h
>   INSTALL include/linux/netfilter/xt_string.h
>   INSTALL include/linux/netfilter/xt_tcpmss.h
>   INSTALL include/linux/netfilter/xt_tcpudp.h
>   UNIFDEF include/linux/netfilter/nf_conntrack_common.h
>   UNIFDEF include/linux/netfilter/nf_conntrack_ftp.h
>   UNIFDEF include/linux/netfilter/nf_conntrack_tcp.h
>   UNIFDEF include/linux/netfilter/nfnetlink.h
>   UNIFDEF include/linux/netfilter/x_tables.h
>   UNIFDEF include/linux/netfilter/xt_physdev.h
>   MKDIR   include/linux/netfilter_arp
>   INSTALL include/linux/netfilter_arp/arpt_mangle.h
>   UNIFDEF include/linux/netfilter_arp/arp_tables.h
>   MKDIR   include/linux/netfilter_bridge
>   INSTALL include/linux/netfilter_bridge/ebt_among.h
>   INSTALL include/linux/netfilter_bridge/ebt_arp.h
>   INSTALL include/linux/netfilter_bridge/ebt_arpreply.h
>   INSTALL include/linux/netfilter_bridge/ebt_ip.h
>   INSTALL include/linux/netfilter_bridge/ebt_limit.h
>   INSTALL include/linux/netfilter_bridge/ebt_log.h
>   INSTALL include/linux/netfilter_bridge/ebt_mark_m.h
>   INSTALL include/linux/netfilter_bridge/ebt_mark_t.h
>   INSTALL include/linux/netfilter_bridge/ebt_nat.h
>   INSTALL include/linux/netfilter_bridge/ebt_pkttype.h
>   INSTALL include/linux/netfilter_bridge/ebt_redirect.h
>   INSTALL include/linux/netfilter_bridge/ebt_stp.h
>   INSTALL include/linux/netfilter_bridge/ebt_ulog.h
>   INSTALL include/linux/netfilter_bridge/ebt_vlan.h
>   UNIFDEF include/linux/netfilter_bridge/ebt_802_3.h
>   UNIFDEF include/linux/netfilter_bridge/ebtables.h
>   MKDIR   include/linux/netfilter_ipv4
>   INSTALL include/linux/netfilter_ipv4/ip_conntrack_helper.h
>   INSTALL include/linux/netfilter_ipv4/ip_conntrack_protocol.h
>   INSTALL include/linux/netfilter_ipv4/ip_conntrack_sctp.h
>   INSTALL include/linux/netfilter_ipv4/ip_conntrack_tcp.h
>   INSTALL include/linux/netfilter_ipv4/ip_conntrack_tftp.h
>   INSTALL include/linux/netfilter_ipv4/ip_nat_pptp.h
>   INSTALL include/linux/netfilter_ipv4/ipt_CLASSIFY.h
>   INSTALL include/linux/netfilter_ipv4/ipt_CLUSTERIP.h
>   INSTALL include/linux/netfilter_ipv4/ipt_CONNMARK.h
>   INSTALL include/linux/netfilter_ipv4/ipt_DSCP.h
>   INSTALL include/linux/netfilter_ipv4/ipt_ECN.h
>   INSTALL include/linux/netfilter_ipv4/ipt_LOG.h
>   INSTALL include/linux/netfilter_ipv4/ipt_MARK.h
>   INSTALL include/linux/netfilter_ipv4/ipt_NFQUEUE.h
>   INSTALL include/linux/netfilter_ipv4/ipt_REJECT.h
>   INSTALL include/linux/netfilter_ipv4/ipt_SAME.h
>   INSTALL include/linux/netfilter_ipv4/ipt_TCPMSS.h
>   INSTALL include/linux/netfilter_ipv4/ipt_TOS.h
>   INSTALL include/linux/netfilter_ipv4/ipt_TTL.h
>   INSTALL include/linux/netfilter_ipv4/ipt_ULOG.h
>   INSTALL include/linux/netfilter_ipv4/ipt_addrtype.h
>   INSTALL include/linux/netfilter_ipv4/ipt_ah.h
>   INSTALL include/linux/netfilter_ipv4/ipt_comment.h
>   INSTALL include/linux/netfilter_ipv4/ipt_connbytes.h
>   INSTALL include/linux/netfilter_ipv4/ipt_conntrack.h
>   INSTALL include/linux/netfilter_ipv4/ipt_dccp.h
>   INSTALL include/linux/netfilter_ipv4/ipt_esp.h
>   INSTALL include/linux/netfilter_ipv4/ipt_hashlimit.h
>   INSTALL include/linux/netfilter_ipv4/ipt_helper.h
>   INSTALL include/linux/netfilter_ipv4/ipt_iprange.h
>   INSTALL include/linux/netfilter_ipv4/ipt_length.h
>   INSTALL include/linux/netfilter_ipv4/ipt_limit.h
>   INSTALL include/linux/netfilter_ipv4/ipt_mac.h
>   INSTALL include/linux/netfilter_ipv4/ipt_multiport.h
>   INSTALL include/linux/netfilter_ipv4/ipt_owner.h
>   INSTALL include/linux/netfilter_ipv4/ipt_physdev.h
>   INSTALL include/linux/netfilter_ipv4/ipt_pkttype.h
>   INSTALL include/linux/netfilter_ipv4/ipt_policy.h
>   INSTALL include/linux/netfilter_ipv4/ipt_realm.h
>   INSTALL include/linux/netfilter_ipv4/ipt_recent.h
>   INSTALL include/linux/netfilter_ipv4/ipt_sctp.h
>   INSTALL include/linux/netfilter_ipv4/ipt_state.h
>   INSTALL include/linux/netfilter_ipv4/ipt_string.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_conntrack.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_conntrack_h323.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_conntrack_irc.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_conntrack_pptp.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_conntrack_proto_gre.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_conntrack_tuple.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_nat.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_nat_rule.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_queue.h
>   UNIFDEF include/linux/netfilter_ipv4/ip_tables.h
>   MKDIR   include/linux/netfilter_ipv6
>   INSTALL include/linux/netfilter_ipv6/ip6t_HL.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_LOG.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_MARK.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_REJECT.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_ah.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_esp.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_frag.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_ipv6header.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_length.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_limit.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_mac.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_multiport.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_opts.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_owner.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_physdev.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_policy.h
>   INSTALL include/linux/netfilter_ipv6/ip6t_rt.h
>   UNIFDEF include/linux/netfilter_ipv6/ip6_tables.h
>   MKDIR   include/linux/nfsd
>   UNIFDEF include/linux/nfsd/auth.h
>   UNIFDEF include/linux/nfsd/const.h
>   UNIFDEF include/linux/nfsd/debug.h
>   UNIFDEF include/linux/nfsd/export.h
>   UNIFDEF include/linux/nfsd/nfsfh.h
>   UNIFDEF include/linux/nfsd/stats.h
>   UNIFDEF include/linux/nfsd/syscall.h
>   MKDIR   include/linux/raid
>   INSTALL include/linux/raid/md_p.h
>   INSTALL include/linux/raid/md_u.h
>   MKDIR   include/linux/sunrpc
>   UNIFDEF include/linux/sunrpc/debug.h
>   MKDIR   include/linux/tc_act
>   INSTALL include/linux/tc_act/tc_gact.h
>   INSTALL include/linux/tc_act/tc_ipt.h
>   INSTALL include/linux/tc_act/tc_mirred.h
>   INSTALL include/linux/tc_act/tc_pedit.h
>   INSTALL include/linux/a.out.h
>   INSTALL include/linux/affs_hardblocks.h
>   INSTALL include/linux/aio_abi.h
>   INSTALL include/linux/arcfb.h
>   INSTALL include/linux/atm_eni.h
>   INSTALL include/linux/atm_he.h
>   INSTALL include/linux/atm_idt77105.h
>   INSTALL include/linux/atm_nicstar.h
>   INSTALL include/linux/atm_zatm.h
>   INSTALL include/linux/atmapi.h
>   INSTALL include/linux/atmbr2684.h
>   INSTALL include/linux/atmclip.h
>   INSTALL include/linux/atmioc.h
>   INSTALL include/linux/atmlec.h
>   INSTALL include/linux/atmmpc.h
>   INSTALL include/linux/atmppp.h
>   INSTALL include/linux/atmsap.h
>   INSTALL include/linux/atmsvc.h
>   INSTALL include/linux/auto_fs4.h
>   INSTALL include/linux/auxvec.h
>   INSTALL include/linux/awe_voice.h
>   INSTALL include/linux/ax25.h
>   INSTALL include/linux/b1lli.h
>   INSTALL include/linux/baycom.h
>   INSTALL include/linux/bfs_fs.h
>   INSTALL include/linux/blkpg.h
>   INSTALL include/linux/bpqether.h
>   INSTALL include/linux/cdk.h
>   INSTALL include/linux/chio.h
>   INSTALL include/linux/coda_psdev.h
>   INSTALL include/linux/coff.h
>   INSTALL include/linux/comstats.h
>   INSTALL include/linux/consolemap.h
>   INSTALL include/linux/cycx_cfm.h
>   INSTALL include/linux/dlm_device.h
>   INSTALL include/linux/dm-ioctl.h
>   INSTALL include/linux/dn.h
>   INSTALL include/linux/dqblk_v1.h
>   INSTALL include/linux/dqblk_v2.h
>   INSTALL include/linux/dqblk_xfs.h
>   INSTALL include/linux/efs_fs_sb.h
>   INSTALL include/linux/elf-em.h
>   INSTALL include/linux/elf-fdpic.h
>   INSTALL include/linux/elf.h
>   INSTALL include/linux/fadvise.h
>   INSTALL include/linux/fd.h
>   INSTALL include/linux/fdreg.h
>   INSTALL include/linux/fib_rules.h
>   INSTALL include/linux/fuse.h
>   INSTALL include/linux/gen_stats.h
>   INSTALL include/linux/genetlink.h
>   INSTALL include/linux/gigaset_dev.h
>   INSTALL include/linux/hdsmart.h
>   INSTALL include/linux/hysdn_if.h
>   INSTALL include/linux/i2c-dev.h
>   INSTALL include/linux/i8k.h
>   INSTALL include/linux/icmp.h
>   INSTALL include/linux/if.h
>   INSTALL include/linux/if_arcnet.h
>   INSTALL include/linux/if_arp.h
>   INSTALL include/linux/if_bonding.h
>   INSTALL include/linux/if_cablemodem.h
>   INSTALL include/linux/if_fc.h
>   INSTALL include/linux/if_hippi.h
>   INSTALL include/linux/if_infiniband.h
>   INSTALL include/linux/if_packet.h
>   INSTALL include/linux/if_plip.h
>   INSTALL include/linux/if_ppp.h
>   INSTALL include/linux/if_slip.h
>   INSTALL include/linux/if_strip.h
>   INSTALL include/linux/if_tunnel.h
>   INSTALL include/linux/in6.h
>   INSTALL include/linux/in_route.h
>   INSTALL include/linux/ioctl.h
>   INSTALL include/linux/ip.h
>   INSTALL include/linux/ip_mp_alg.h
>   INSTALL include/linux/ipmi_msgdefs.h
>   INSTALL include/linux/ipsec.h
>   INSTALL include/linux/ipx.h
>   INSTALL include/linux/irda.h
>   INSTALL include/linux/isdn_divertif.h
>   INSTALL include/linux/iso_fs.h
>   INSTALL include/linux/ixjuser.h
>   INSTALL include/linux/jffs2.h
>   INSTALL include/linux/keyctl.h
>   INSTALL include/linux/limits.h
>   INSTALL include/linux/lock_dlm_plock.h
>   INSTALL include/linux/magic.h
>   INSTALL include/linux/major.h
>   INSTALL include/linux/matroxfb.h
>   INSTALL include/linux/meye.h
>   INSTALL include/linux/minix_fs.h
>   INSTALL include/linux/mmtimer.h
>   INSTALL include/linux/mqueue.h
>   INSTALL include/linux/mtio.h
>   INSTALL include/linux/ncp_no.h
>   INSTALL include/linux/neighbour.h
>   INSTALL include/linux/netfilter_arp.h
>   INSTALL include/linux/netrom.h
>   INSTALL include/linux/nfs2.h
>   INSTALL include/linux/nfs4_mount.h
>   INSTALL include/linux/nfs_mount.h
>   INSTALL include/linux/oom.h
>   INSTALL include/linux/param.h
>   INSTALL include/linux/pci_regs.h
>   INSTALL include/linux/pfkeyv2.h
>   INSTALL include/linux/pg.h
>   INSTALL include/linux/pkt_cls.h
>   INSTALL include/linux/pkt_sched.h
>   INSTALL include/linux/posix_types.h
>   INSTALL include/linux/ppdev.h
>   INSTALL include/linux/prctl.h
>   INSTALL include/linux/ps2esdi.h
>   INSTALL include/linux/qnxtypes.h
>   INSTALL include/linux/quotaio_v1.h
>   INSTALL include/linux/quotaio_v2.h
>   INSTALL include/linux/radeonfb.h
>   INSTALL include/linux/raw.h
>   INSTALL include/linux/resource.h
>   INSTALL include/linux/rose.h
>   INSTALL include/linux/smbno.h
>   INSTALL include/linux/snmp.h
>   INSTALL include/linux/sockios.h
>   INSTALL include/linux/som.h
>   INSTALL include/linux/sound.h
>   INSTALL include/linux/synclink.h
>   INSTALL include/linux/telephony.h
>   INSTALL include/linux/termios.h
>   INSTALL include/linux/ticable.h
>   INSTALL include/linux/times.h
>   INSTALL include/linux/tiocl.h
>   INSTALL include/linux/tipc.h
>   INSTALL include/linux/toshiba.h
>   INSTALL include/linux/ultrasound.h
>   INSTALL include/linux/un.h
>   INSTALL include/linux/utime.h
>   INSTALL include/linux/video_decoder.h
>   INSTALL include/linux/video_encoder.h
>   INSTALL include/linux/videotext.h
>   INSTALL include/linux/vt.h
>   INSTALL include/linux/x25.h
>   INSTALL include/linux/xattr.h
>   UNIFDEF include/linux/acct.h
>   UNIFDEF include/linux/adb.h
>   UNIFDEF include/linux/adfs_fs.h
>   UNIFDEF include/linux/agpgart.h
>   UNIFDEF include/linux/apm_bios.h
>   UNIFDEF include/linux/atalk.h
>   UNIFDEF include/linux/atm.h
>   UNIFDEF include/linux/atm_tcp.h
>   UNIFDEF include/linux/atmarp.h
>   UNIFDEF include/linux/atmdev.h
>   UNIFDEF include/linux/audit.h
>   UNIFDEF include/linux/auto_fs.h
>   UNIFDEF include/linux/binfmts.h
>   UNIFDEF include/linux/capability.h
>   UNIFDEF include/linux/capi.h
>   UNIFDEF include/linux/cciss_ioctl.h
>   UNIFDEF include/linux/cdrom.h
>   UNIFDEF include/linux/cm4000_cs.h
>   UNIFDEF include/linux/cn_proc.h
>   UNIFDEF include/linux/coda.h
>   UNIFDEF include/linux/connector.h
>   UNIFDEF include/linux/cramfs_fs.h
>   UNIFDEF include/linux/cuda.h
>   UNIFDEF include/linux/cyclades.h
>   UNIFDEF include/linux/dccp.h
>   UNIFDEF include/linux/dirent.h
>   UNIFDEF include/linux/dlm.h
>   UNIFDEF include/linux/elfcore.h
>   UNIFDEF include/linux/errno.h
>   UNIFDEF include/linux/errqueue.h
>   UNIFDEF include/linux/ethtool.h
>   UNIFDEF include/linux/eventpoll.h
>   UNIFDEF include/linux/ext2_fs.h
>   UNIFDEF include/linux/ext3_fs.h
>   UNIFDEF include/linux/fb.h
>   UNIFDEF include/linux/fcntl.h
>   UNIFDEF include/linux/filter.h
>   UNIFDEF include/linux/flat.h
>   UNIFDEF include/linux/fs.h
>   UNIFDEF include/linux/futex.h
>   UNIFDEF include/linux/gameport.h
>   UNIFDEF include/linux/generic_serial.h
>   UNIFDEF include/linux/genhd.h
>   UNIFDEF include/linux/gfs2_ondisk.h
>   UNIFDEF include/linux/hayesesp.h
>   UNIFDEF include/linux/hdlc.h
>   UNIFDEF include/linux/hdlcdrv.h
>   UNIFDEF include/linux/hdreg.h
>   UNIFDEF include/linux/hiddev.h
>   UNIFDEF include/linux/hpet.h
>   UNIFDEF include/linux/i2c.h
>   UNIFDEF include/linux/i2o-dev.h
>   UNIFDEF include/linux/icmpv6.h
>   UNIFDEF include/linux/if_addr.h
>   UNIFDEF include/linux/if_bridge.h
>   UNIFDEF include/linux/if_ec.h
>   UNIFDEF include/linux/if_eql.h
>   UNIFDEF include/linux/if_ether.h
>   UNIFDEF include/linux/if_fddi.h
>   UNIFDEF include/linux/if_frad.h
>   UNIFDEF include/linux/if_link.h
>   UNIFDEF include/linux/if_ltalk.h
>   UNIFDEF include/linux/if_pppox.h
>   UNIFDEF include/linux/if_shaper.h
>   UNIFDEF include/linux/if_tr.h
>   UNIFDEF include/linux/if_tun.h
>   UNIFDEF include/linux/if_vlan.h
>   UNIFDEF include/linux/if_wanpipe.h
>   UNIFDEF include/linux/igmp.h
>   UNIFDEF include/linux/in.h
>   UNIFDEF include/linux/inet_diag.h
>   UNIFDEF include/linux/inotify.h
>   UNIFDEF include/linux/input.h
>   UNIFDEF include/linux/ipc.h
>   UNIFDEF include/linux/ipmi.h
>   UNIFDEF include/linux/ipv6.h
>   UNIFDEF include/linux/ipv6_route.h
>   UNIFDEF include/linux/isdn.h
>   UNIFDEF include/linux/isdn_ppp.h
>   UNIFDEF include/linux/isdnif.h
>   UNIFDEF include/linux/isicom.h
>   UNIFDEF include/linux/jbd.h
>   UNIFDEF include/linux/joystick.h
>   UNIFDEF include/linux/kd.h
>   UNIFDEF include/linux/kdev_t.h
>   UNIFDEF include/linux/kernel.h
>   UNIFDEF include/linux/kernelcapi.h
>   UNIFDEF include/linux/keyboard.h
>   UNIFDEF include/linux/llc.h
>   UNIFDEF include/linux/loop.h
>   UNIFDEF include/linux/lp.h
>   UNIFDEF include/linux/mempolicy.h
>   UNIFDEF include/linux/mii.h
>   UNIFDEF include/linux/mman.h
>   UNIFDEF include/linux/mroute.h
>   UNIFDEF include/linux/msdos_fs.h
>   UNIFDEF include/linux/msg.h
>   UNIFDEF include/linux/n_r3964.h
>   UNIFDEF include/linux/nbd.h
>   UNIFDEF include/linux/ncp.h
>   UNIFDEF include/linux/ncp_fs.h
>   UNIFDEF include/linux/ncp_mount.h
>   UNIFDEF include/linux/net.h
>   UNIFDEF include/linux/netdevice.h
>   UNIFDEF include/linux/netfilter.h
>   UNIFDEF include/linux/netfilter_bridge.h
>   UNIFDEF include/linux/netfilter_decnet.h
>   UNIFDEF include/linux/netfilter_ipv4.h
>   UNIFDEF include/linux/netfilter_ipv6.h
>   UNIFDEF include/linux/netlink.h
>   UNIFDEF include/linux/nfs.h
>   UNIFDEF include/linux/nfs3.h
>   UNIFDEF include/linux/nfs4.h
>   UNIFDEF include/linux/nfs_fs.h
>   UNIFDEF include/linux/nfs_idmap.h
>   UNIFDEF include/linux/nfsacl.h
>   UNIFDEF include/linux/nubus.h
>   UNIFDEF include/linux/nvram.h
>   UNIFDEF include/linux/parport.h
>   UNIFDEF include/linux/patchkey.h
>   UNIFDEF include/linux/pci.h
>   UNIFDEF include/linux/personality.h
>   UNIFDEF include/linux/pktcdvd.h
>   UNIFDEF include/linux/pmu.h
>   UNIFDEF include/linux/poll.h
>   UNIFDEF include/linux/ppp-comp.h
>   UNIFDEF include/linux/ppp_defs.h
>   UNIFDEF include/linux/ptrace.h
>   UNIFDEF include/linux/qnx4_fs.h
>   UNIFDEF include/linux/quota.h
>   UNIFDEF include/linux/random.h
>   UNIFDEF include/linux/reboot.h
>   UNIFDEF include/linux/reiserfs_fs.h
>   UNIFDEF include/linux/reiserfs_xattr.h
>   UNIFDEF include/linux/romfs_fs.h
>   UNIFDEF include/linux/route.h
>   UNIFDEF include/linux/rtc.h
>   UNIFDEF include/linux/rtnetlink.h
>   UNIFDEF include/linux/scc.h
>   UNIFDEF include/linux/sched.h
>   UNIFDEF include/linux/sdla.h
>   UNIFDEF include/linux/selinux_netlink.h
>   UNIFDEF include/linux/sem.h
>   UNIFDEF include/linux/serial.h
>   UNIFDEF include/linux/serial_core.h
>   UNIFDEF include/linux/serio.h
>   UNIFDEF include/linux/shm.h
>   UNIFDEF include/linux/signal.h
>   UNIFDEF include/linux/smb.h
>   UNIFDEF include/linux/smb_fs.h
>   UNIFDEF include/linux/smb_mount.h
>   UNIFDEF include/linux/socket.h
>   UNIFDEF include/linux/sonet.h
>   UNIFDEF include/linux/sonypi.h
>   UNIFDEF include/linux/soundcard.h
>   UNIFDEF include/linux/stat.h
>   UNIFDEF include/linux/stddef.h
>   UNIFDEF include/linux/sysctl.h
>   UNIFDEF include/linux/tcp.h
>   UNIFDEF include/linux/time.h
>   UNIFDEF include/linux/timex.h
>   UNIFDEF include/linux/tty.h
>   UNIFDEF include/linux/types.h
>   UNIFDEF include/linux/udf_fs_i.h
>   UNIFDEF include/linux/udp.h
>   UNIFDEF include/linux/uinput.h
>   UNIFDEF include/linux/uio.h
>   UNIFDEF include/linux/unistd.h
>   UNIFDEF include/linux/usb_ch9.h
>   UNIFDEF include/linux/usbdevice_fs.h
>   UNIFDEF include/linux/user.h
>   UNIFDEF include/linux/utsname.h
>   UNIFDEF include/linux/videodev.h
>   UNIFDEF include/linux/videodev2.h
>   UNIFDEF include/linux/wait.h
>   UNIFDEF include/linux/wanrouter.h
>   UNIFDEF include/linux/watchdog.h
>   UNIFDEF include/linux/wireless.h
>   UNIFDEF include/linux/xfrm.h
>   INSTALL include/linux/version.h
>   MKDIR   include/mtd
>   INSTALL include/mtd/inftl-user.h
>   INSTALL include/mtd/jffs2-user.h
>   INSTALL include/mtd/mtd-abi.h
>   INSTALL include/mtd/mtd-user.h
>   INSTALL include/mtd/nftl-user.h
>   MKDIR   include/rdma
>   INSTALL include/rdma/ib_user_mad.h
>   MKDIR   include/scsi
>   INSTALL include/scsi/scsi.h
>   UNIFDEF include/scsi/scsi_ioctl.h
>   UNIFDEF include/scsi/sg.h
>   MKDIR   include/sound
>   INSTALL include/sound/asound_fm.h
>   INSTALL include/sound/hdsp.h
>   INSTALL include/sound/hdspm.h
>   INSTALL include/sound/sfnt_info.h
>   INSTALL include/sound/sscape_ioctl.h
>   UNIFDEF include/sound/asequencer.h
>   UNIFDEF include/sound/asound.h
>   UNIFDEF include/sound/emu10k1.h
>   UNIFDEF include/sound/sb16_csp.h
>   MKDIR   include/video
>   UNIFDEF include/video/sisfb.h
> make[1]: Leaving directory
> `/cygdrive/d/buildroot_work/buildroot/build_arm/linux-2.6.20.4'
> touch /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/linux/.configured
> [ -d /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm ] ||
> /usr/bin/install -d
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm
> bzcat /cygdrive/d/buildroot_work/buildroot/dl/uClibc-snapshot.tar.bz2
> | tar -C /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm
> -xf -
> touch /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.unpacked
> cp -f  toolchain/uClibc/uClibc-0.9.29.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/cygdrive/d/buildroot_work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-",g'
> \
> 		-e 's,# TARGET_arm is not set,TARGET_arm=y,g' \
> 		-e 's,^TARGET_ARCH="none",TARGET_ARCH=\"arm\",g' \
> 		-e 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/linux\",g'
> \
> 		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/linux/include\",g'
> \
> 		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
> 		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
> 		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
> 		/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
> 		 /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /bin/echo "CONFIG_"ARM920T"=y" >> \
> 		/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /bin/echo "# CONFIG_ARM_OABI is not set" >>
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /bin/echo "CONFIG_ARM_EABI=y" >>
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> '/^# ARCH_LITTLE_ENDIAN /{s,# ,,;s, is not set,=y,g}' \
> 		-e '/^# ARCH_BIG_ENDIAN /{s,# ,,;s, is not set,=n,g}' \
> 		/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> '/^# ARCH_WANTS_LITTLE_ENDIAN /{s,# ,,;s, is not set,=y,g}' \
> 		-e '/^# ARCH_WANTS_BIG_ENDIAN /{s,# ,,;s, is not set,=n,g}' \
> 		/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> # The above doesn't work for me, so redo
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> 's/.*\(ARCH_BIG_ENDIAN\).*/# \1 is not set/g' \
> 		-e 's/.*\(ARCH_WANTS_BIG_ENDIAN\).*/# \1 is not set/g' \
> 		-e 's/.*\(ARCH_LITTLE_ENDIAN\).*/\1=y/g' \
> 		-e 's/.*\(ARCH_WANTS_LITTLE_ENDIAN\).*/\1=y/g' \
> 		/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> '/UCLIBC_HAS_THREADS/d'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> '/LINUXTHREADS/d'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> '/LINUXTHREADS_OLD/d'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> '/PTHREADS_DEBUG_SUPPORT/d'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> '/UCLIBC_HAS_THREADS_NATIVE/d'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> echo "UCLIBC_HAS_THREADS=y" >>
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> echo "# LINUXTHREADS is not set" >>
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> echo "LINUXTHREADS_OLD=y" >>
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> echo "# UCLIBC_HAS_THREADS_NATIVE is not set" >>
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> echo "# PTHREADS_DEBUG_SUPPORT is not set" >>
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/bin/sed -i -e
> 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g'
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config
> mkdir -p /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc_dev/usr/include
> mkdir -p /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc_dev/usr/lib
> mkdir -p /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc_dev/lib
> make MAKE="make -j1" -C
> /cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc \
> 		PREFIX=/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc_dev/ \
> 		DEVEL_PREFIX=/usr/ \
> 		RUNTIME_PREFIX=/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc_dev/
> \
> 		HOSTCC="gcc" \
> 		oldconfig
> make[1]: Entering directory
> `/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc'
> install -d include/bits
> /bin/sh: /cygdrive/d/buildroot_work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
> No such file or directory
> make[2]: /cygdrive/d/buildroot_work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
> Command not found
> make[2]: /cygdrive/d/buildroot_work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
> Command not found
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  -MM
> *.c > .depend 2>/dev/null || :
> /bin/sh: /cygdrive/d/buildroot_work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
> No such file or directory
> make[2]: /cygdrive/d/buildroot_work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
> Command not found
> make[2]: /cygdrive/d/buildroot_work/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc:
> Command not found
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> conf.c -o conf.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> kxgettext.c -o kxgettext.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> lxdialog/checklist.c -o lxdialog/checklist.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> lxdialog/inputbox.c -o lxdialog/inputbox.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> lxdialog/menubox.c -o lxdialog/menubox.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> lxdialog/textbox.c -o lxdialog/textbox.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> lxdialog/util.c -o lxdialog/util.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> lxdialog/yesno.c -o lxdialog/yesno.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
> mconf.c -o mconf.o
> cat zconf.tab.c_shipped > zconf.tab.c
> cat lex.zconf.c_shipped > lex.zconf.c
> cat zconf.hash.c_shipped > zconf.hash.c
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  -I. -c
> zconf.tab.c -o zconf.tab.o
> gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE
> conf.o  zconf.tab.o -o conf
> conf.o:conf.c:(.text+0xb2): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0xc6): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0xda): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0xf2c): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0x10c5): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0x116f): more undefined references to
> `_libintl_gettext' follow
> collect2: ld returned 1 exit status
> make[2]: *** [conf] Error 1
> make[1]: *** [extra/config/conf] Error 2
> make[1]: Leaving directory
> `/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc'
> make: *** [/cygdrive/d/buildroot_work/buildroot/toolchain_build_arm/uClibc/.config]
> Error 2
> 
> 
> 
> pls help i am stuck on this more than 2 weeks now
> 
> ICE
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
