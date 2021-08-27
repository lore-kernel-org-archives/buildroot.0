Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEC8C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 04:47:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D92860F6F
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 04:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D92860F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx-topmail.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B6E614B6;
	Fri, 27 Aug 2021 04:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZt34_kg1WL2; Fri, 27 Aug 2021 04:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82466614BA;
	Fri, 27 Aug 2021 04:47:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39C481BF616
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 04:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27804826B0
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 04:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhystGS27bGf for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 04:47:07 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27CF482681
 for <buildroot@busybox.net>; Fri, 27 Aug 2021 04:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630039625;
 bh=hLWxJK2lLbzE6wMJxG2hJ3367k/pgf3788zPpqzGu+Q=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=KtEZzDyfw2uGQSVdfXjAJAj9f3jrum+1JJmw+4jcm/izz9r6bLrZ0O3Q1Y6mnwGJK
 viJa8ihw6OLO+ZdPyjjLMIHA/7OeNqIywDK7fprZyWfDOsyE0e5vHUWizu6ZCt7+H4
 QTF6NV7I97/0JNSC71rMldqm3s8BfQmws9+EvTxM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [172.16.4.129] ([176.199.141.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McYCb-1mryUk1765-00d0w7 for
 <buildroot@busybox.net>; Fri, 27 Aug 2021 06:41:59 +0200
To: buildroot@busybox.net
From: Matthias <mp1009@gmx-topmail.de>
Message-ID: <e70cdba8-5e06-d1ca-2f42-b9741454451d@gmx-topmail.de>
Date: Fri, 27 Aug 2021 06:41:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:ezhJojJbTXhTqF1GLbJ9bV3CP09hDd2ID2yAopFG/TEAqjAqH+6
 xsjQ9q8lRNsK2MTsYZdemhKREQ52m0P6YQY7hE8L14w5718nrfAsK3rTsV/YoeKYsRY22sF
 c9Dktu+79jSuTuu3I/TBBrEgMO6PYWdHmveKba6NwTiVNPSasQ++3Dyr+Kz7JKYlCfFyBl5
 nlr0WmsaVCCRmHUWt745g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YiyzdExZvc8=:msohee3tZeSFrwMlE0zEux
 I0Cj86jFo+gDG52iH7U+HosKJBJTXK3g7+LqRVCa5xxGZtOplfGqqIjTSQFGp06ySEpvMSz1H
 qpmeoGOafkAKEUfiTkus6zmmNmKesYjlEYZtSmfEDazFTzlYFgzvafbfrWflEkEI6FwBcMRl0
 r8W5JJ3zr3eDhbI252+sd8Zr++UkvknzJfb9R+XwCWqr7nWAs8IbA2xw2zehWBvD+gWyFdb4e
 6FBWMVcBDGALvOJ+96kFRX0zF6EhIUsO2k7uuOLAil19IT6kxntNCJWjrX/CylPMilA2iw4I1
 2bGxaMpdXZBE/yF6LTMRtLmkzW104p6j6QAYLy9CsLQ9qbtEFZTjAsqzAXRFEtjm2jfIcPDna
 WXb+dEFNHnhE5YGrWuJHyuLjVRjlF6IutvxjB+zg7cW3r7W+S1kmgscOowmR0zV+J6bEjtuMX
 ENBQMTNerK+owN0MtGcpyOyqUP+PrA1DMwk/clFioZ+lrRJKxz9aR68cNx91JZhnysWX0yDAz
 xvVtTLLVHW0Xxna+XnGe1BsBdnB0Drwqw0TQQ6FQYRzZvn1gyybU+LZPjnBKV9oei6EtiibWc
 88cZ0nrUZ5fj+umXWyKc/1G7objGmfRn5YX4VNt7YhK4Yx9I16poHTuyWQHfYlX07dAm+5DbY
 A6s70FMESlqhjewvU5WrStGmpvdGeY1qCKEsR2Dn/USxDbJapw0YGYI6L2IZmKzNdVe4/3/qX
 gy873NnpCN1UNzwDYhJUJeKtrvPzLibxsRrrUxYTK3PdIVBaKPf/YGeY0r10rb2mfi28MgMBp
 Ctfupz68UgY49kMd5Tkna7+MuI/WNyl+ENq3RlpO2obzS5AznhyT0akhGbvTp6fyXvuPojnYk
 ykMXwPv7iW6HGU1eJxNSD55yUcPPm9QM48mewwlkPkvidgk12Y4d7lEB4bcYImQ3G6ZV4lB/o
 7wifsEm//FoUeY6CFk07+b6xzl60nGuWKbLDeHEFrL4zf0ia/KX981tJ1wdptTvGN6B1M7HA4
 S7uSvBVAKg/jEg5qc4c9RuuC+IFxZZilDRDawPxtNlT2t0fJDIBEQtDFOKVSxO4xgKNkSYmUc
 JstbXvheATbJlcDdUx1FDDmwXasH6e8e5DSfE+7qJZ36bvKQDw7CuzNdA==
Subject: [Buildroot] OpenSSH login fails on Raspberry Pi
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,
I'm trying to set up OpenSSH on a Raspberry Pi 3 B+ but the server constantly closes connection when trying to log in.
The system was built by the latest Buildroot (2021.08-rc2) and uses an external toolchain (Arm ARM 2020.11). The root password is set and PermitRootLogin is set to 'yes' in /etc/ssh/sshd_config. I was also replacing OpenSSH_8.6p1 by the latest version (8.7p1) which was released recently and an older version (8.4p1), but nothing changed.

When using dropbear instead of OpenSSH, everything works fine right out of the box, btw.

Any help is being appreciated.

Here's some debug output of ssh and sshd:

# ssh -vvv root@localhost
OpenSSH_8.6p1, OpenSSL 1.1.1l  24 Aug 2021
debug1: Reading configuration data /etc/ssh/ssh_config
debug3: expanded UserKnownHostsFile '~/.ssh/known_hosts' -> '/root/.ssh/known_hosts'
debug3: expanded UserKnownHostsFile '~/.ssh/known_hosts2' -> '/root/.ssh/known_hosts2'
debug1: Authenticator provider $SSH_SK_PROVIDER did not resolve; disabling
debug2: resolving "localhost" port 22
debug3: ssh_connect_direct: entering
debug1: Connecting to localhost [127.0.0.1] port 22.
debug3: set_sock_tos: set socket 3 IP_TOS 0x48
debug1: Connection established.
debug1: identity file /root/.ssh/id_rsa type -1
debug1: identity file /root/.ssh/id_rsa-cert type -1
debug1: identity file /root/.ssh/id_dsa type -1
debug1: identity file /root/.ssh/id_dsa-cert type -1
debug1: identity file /root/.ssh/id_ecdsa type -1
debug1: identity file /root/.ssh/id_ecdsa-cert type -1
debug1: identity file /root/.ssh/id_ecdsa_sk type -1
debug1: identity file /root/.ssh/id_ecdsa_sk-cert type -1
debug1: identity file /root/.ssh/id_ed25519 type -1
debug1: identity file /root/.ssh/id_ed25519-cert type -1
debug1: identity file /root/.ssh/id_ed25519_sk type -1
debug1: identity file /root/.ssh/id_ed25519_sk-cert type -1
debug1: identity file /root/.ssh/id_xmss type -1
debug1: identity file /root/.ssh/id_xmss-cert type -1
debug1: Local version string SSH-2.0-OpenSSH_8.6
debug1: Remote protocol version 2.0, remote software version OpenSSH_8.6
debug1: compat_banner: match: OpenSSH_8.6 pat OpenSSH* compat 0x04000000
debug2: fd 3 setting O_NONBLOCK
debug1: Authenticating to localhost:22 as 'root'
debug3: record_hostkey: found key type ED25519 in file /root/.ssh/known_hosts:1
debug3: load_hostkeys_file: loaded 1 keys from localhost
debug1: load_hostkeys: fopen /root/.ssh/known_hosts2: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts2: No such file or directory
debug3: order_hostkeyalgs: have matching best-preference key type ssh-ed25519-cert-v01@openssh.com, using HostkeyAlgorithms verbatim
debug3: send packet: type 20
debug1: SSH2_MSG_KEXINIT sent
debug3: receive packet: type 20
debug1: SSH2_MSG_KEXINIT received
debug2: local client KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256,ext-info-c
debug2: host key algorithms: ssh-ed25519-cert-v01@openssh.com,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,sk-ssh-ed25519-cert-v01@openssh.com,sk-ecdsa-sha2-nistp256-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,ssh-ed25519,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ssh-ed25519@openssh.com,sk-ecdsa-sha2-nistp256@openssh.com,rsa-sha2-512,rsa-sha2-256,ssh-rsa
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com,zlib
debug2: compression stoc: none,zlib@openssh.com,zlib
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug2: peer server KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256
debug2: host key algorithms: rsa-sha2-512,rsa-sha2-256,ssh-rsa,ecdsa-sha2-nistp256,ssh-ed25519
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com
debug2: compression stoc: none,zlib@openssh.com
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: ssh-ed25519
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug3: send packet: type 30
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug3: receive packet: type 31
debug1: SSH2_MSG_KEX_ECDH_REPLY received
debug1: Server host key: ssh-ed25519 SHA256:vWKSulbx2tKNszD+Q4+TWS/7tA5Bq9fT6LBilpodk3U
debug3: record_hostkey: found key type ED25519 in file /root/.ssh/known_hosts:1
debug3: load_hostkeys_file: loaded 1 keys from localhost
debug1: load_hostkeys: fopen /root/.ssh/known_hosts2: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts: No such file or directory
debug1: load_hostkeys: fopen /etc/ssh/ssh_known_hosts2: No such file or directory
debug1: Host 'localhost' is known and matches the ED25519 host key.
debug1: Found key in /root/.ssh/known_hosts:1
debug3: send packet: type 21
debug2: set_newkeys: mode 1
debug1: rekey out after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting S[  354.384103] audit: type=1326 audit(1629986646.781:8): auid=4294967295 uid=1001 gid=1001 ses=4294967295 pid=234 comm="sshd" exe="/usr/sbin/sshd" sig=31 arch=40000028 syscall=407 compat=0 ip=0x76b6b766 code=0x0
SH2_MSG_NEWKEYS
debug3: receive packet: type 21
debug1: SSH2_MSG_NEWKEYS received
debug2: set_newkeys: mode 0
debug1: rekey in after 134217728 blocks
debug1: Will attempt key: /root/.ssh/id[  354.419992] audit: type=1701 audit(1629986646.781:9): auid=4294967295 uid=1001 gid=1001 ses=4294967295 pid=234 comm="sshd" exe="/usr/sbin/sshd" sig=31 res=1
_rsa
debug1: Will attempt key: /root/.ssh/id_dsa
debug1: Will attempt key: /root/.ssh/id_ecdsa
debug1: Will attempt key: /root/.ssh/id_ecdsa_sk
debug1: Will attempt key: /root/.ssh/id_ed25519
debug1: Will attempt key: /root/.ssh/id_ed25519_sk
debug1: Will attempt key: /root/.ssh/id_xmss
debug2: pubkey_prepare: done
debug3: send packet: type 5
debug3: receive packet: type 7
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info: server-sig-algs=<ssh-ed25519,sk-ssh-ed25519@openssh.com,ssh-rsa,rsa-sha2-256,rsa-sha2-512,ssh-dss,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ecdsa-sha2-nistp256@openssh.com,webauthn-sk-ecdsa-sha2-nistp256@openssh.com>
debug3: receive packet: type 6
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug3: send packet: type 50
Connection closed by 127.0.0.1 port 22
#


# /usr/sbin/sshd -ddd
debug2: load_server_config: filename /etc/ssh/sshd_config
debug2: load_server_config: done config len = 214
debug2: parse_server_config_depth: config /etc/ssh/sshd_config len 214
debug3: /etc/ssh/sshd_config:32 setting PermitRootLogin yes
debug3: /etc/ssh/sshd_config:41 setting AuthorizedKeysFile .ssh/authorized_keys
debug3: /etc/ssh/sshd_config:109 setting Subsystem sftp	/usr/libexec/sftp-server
debug1: sshd version OpenSSH_8.6, OpenSSL 1.1.1l  24 Aug 2021
debug1: private host key #0: ssh-rsa SHA256:bq4fyrJzWs1LhVaHz9YG40yltBoPNkRZXdyNPUrCPMI
debug1: private host key #1: ecdsa-sha2-nistp256 SHA256:aKEmr4uOGiK2zh6XD8f7a4G4uBoOt2Xu/HQuun8VU8Q
debug1: private host key #2: ssh-ed25519 SHA256:vWKSulbx2tKNszD+Q4+TWS/7tA5Bq9fT6LBilpodk3U
debug1: rexec_argv[0]='/usr/sbin/sshd'
debug1: rexec_argv[1]='-ddd'
debug3: oom_adjust_setup
debug1: Set /proc/self/oom_score_adj from 0 to -1000
debug2: fd 3 setting O_NONBLOCK
debug1: Bind to port 22 on 0.0.0.0.
Server listening on 0.0.0.0 port 22.
debug2: fd 4 setting O_NONBLOCK
debug3: sock_set_v6only: set socket 4 IPV6_V6ONLY
debug1: Bind to port 22 on ::.
Server listening on :: port 22.
debug3: fd 5 is not O_NONBLOCK
debug1: Server will not fork when running in debugging mode.
debug3: send_rexec_state: entering fd = 8 config len 214
debug3: ssh_msg_send: type 0
debug3: send_rexec_state: done
debug1: rexec start in 5 out 5 newsock 5 pipe -1 sock 8
debug3: recv_rexec_state: entering fd = 5
debug3: ssh_msg_recv entering
debug3: recv_rexec_state: done
debug2: parse_server_config_depth: config rexec len 214
debug3: rexec:32 setting PermitRootLogin yes
debug3: rexec:41 setting AuthorizedKeysFile .ssh/authorized_keys
debug3: rexec:109 setting Subsystem sftp	/usr/libexec/sftp-server
debug1: sshd version OpenSSH_8.6, OpenSSL 1.1.1l  24 Aug 2021
debug1: private host key #0: ssh-rsa SHA256:bq4fyrJzWs1LhVaHz9YG40yltBoPNkRZXdyNPUrCPMI
debug1: private host key #1: ecdsa-sha2-nistp256 SHA256:aKEmr4uOGiK2zh6XD8f7a4G4uBoOt2Xu/HQuun8VU8Q
debug1: private host key #2: ssh-ed25519 SHA256:vWKSulbx2tKNszD+Q4+TWS/7tA5Bq9fT6LBilpodk3U
debug1: inetd sockets after dupping: 3, 3
Connection from 10.0.0.64 port 37910 on 10.0.0.192 port 22 rdomain ""
debug1: Local version string SSH-2.0-OpenSSH_8.6
debug1: Remote protocol version 2.0, remote software version OpenSSH_8.4p1 Debian-5
debug1: compat_banner: match: OpenSSH_8.4p1 Debian-5 pat OpenSSH* compat 0x04000000
debug2: fd 3 setting O_NONBLOCK
debug3: ssh_sandbox_init: preparing seccomp filter sandbox
debug2: Network child is on pid 245
debug3: preauth child monitor started
debug3: privsep user:group 1001:1001 [preauth]
debug1: permanently_set_uid: 1001/1001 [preauth]
debug3: ssh_sandbox_child: setting PR_SET_NO_NEW_PRIVS [preauth]
debug3: ssh_sandbox_child: attaching seccomp filter program [preauth]
debug1: list_hostkey_types: rsa-sha2-512,rsa-sha2-256,ssh-rsa,ecdsa-sha2-nistp256,ssh-ed25519 [preauth]
debug3: send packet: type 20 [preauth]
debug1: SSH2_MSG_KEXINIT sent [preauth]
debug3: receive packet: type 20 [preauth]
debug1: SSH2_MSG_KEXINIT received [preauth]
debug2: local server KEXINIT proposal [preauth]
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256 [preauth]
debug2: host key algorithms: rsa-sha2-512,rsa-sha2-256,ssh-rsa,ecdsa-sha2-nistp256,ssh-ed25519 [preauth]
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com [preauth]
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com [preauth]
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1 [preauth]
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1 [preauth]
debug2: compression ctos: none,zlib@openssh.com [preauth]
debug2: compression stoc: none,zlib@openssh.com [preauth]
debug2: languages ctos:  [preauth]
debug2: languages stoc:  [preauth]
debug2: first_kex_follows 0  [preauth]
debug2: reserved 0  [preauth]
debug2: peer client KEXINIT proposal [preauth]
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256,ext-info-c [preauth]
debug2: host key algorithms: ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,sk-ecdsa-sha2-nistp256-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,sk-ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ecdsa-sha2-nistp256@openssh.com,ssh-ed25519,sk-ssh-ed25519@openssh.com,rsa-sha2-512,rsa-sha2-256,ssh-rsa [preauth]
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com [preauth]
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com [preauth]
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1 [preauth]
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1 [preauth]
debug2: compression ctos: none,zlib@openssh.com,zlib [preauth]
debug2: compression stoc: none,zlib@openssh.com,zlib [preauth]
debug2: languages ctos:  [preauth]
debug2: languages stoc:  [preauth]
debug2: first_kex_follows 0  [preauth]
debug2: reserved 0  [preauth]
debug1: kex: algorithm: curve25519-sha256 [preauth]
debug1: kex: host key algorithm: ecdsa-sha2-nistp256 [preauth]
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none [preauth]
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none [preauth]
debug1: expecting SSH2_MSG_KEX_ECDH_INIT [preauth]
debug3: receive packet: type 30 [preauth]
debug1: SSH2_MSG_KEX_ECDH_INIT received [preauth]
debug3: mm_sshkey_sign: entering [preauth]
debug3: mm_request_send: entering, type 6 [preauth]
debug3: mm_sshkey_sign: waiting for MONITOR_ANS_SIGN [preauth]
debug3: mm_request_receive_expect: entering, type 7 [preauth]
debug3: mm_request_receive: entering [preauth]
debug3: mm_request_receive: entering
debug3: monitor_read: checking request 6
debug3: mm_answer_sign: entering
debug3: mm_answer_sign: KEX signature 0x1040a18(100)
debug3: mm_request_send: entering, type 7
debug2: monitor_read: 6 used once, disabling now
debug3: send packet: type 31 [preauth]
debug3: send packet: type 21 [preauth]
debug2: set_newkeys: mode 1 [preauth]
debug1: rekey out after 134217728 blocks [preauth]
debug1: SSH2_MSG_NEWKEYS sent [preauth]
debug1: Sending SSH2_MSG_EXT_INFO [preauth]
debug3: send packet: type 7 [preauth]
debug1: expecting SSH2_MSG_NEWKEYS [preauth]
debug3: receive packet: type 21 [preauth]
debug1: SSH2_MSG_NEWKEYS received [preauth]
debug2: set_newkeys: mode 0 [preauth]
debug1: rekey in after 134217728 blocks [preauth]
debug1: KEX done [[  627.067180] audit: type=1326 audit(1629986919.461:10): auid=4294967295 uid=1001 gid=1001 ses=4294967295 pid=245 comm="sshd" exe="/usr/sbin/sshd" sig=31 arch=40000028 syscall=407 compat=0 ip=0x76ade766 code=0x0
preauth]
debug3: receive packet: type 5 [preauth]
debug3: send packet: type 6 [preauth]
debug3: receive packet: type 50 [preauth]
debug1: userauth-request for user root service ssh-connection method [  627.103651] audit: type=1701 audit(1629986919.461:11): auid=4294967295 uid=1001 gid=1001 ses=4294967295 pid=245 comm="sshd" exe="/usr/sbin/sshd" sig=31 res=1
none [preauth]
debug1: attempt 0 failures 0 [preauth]
debug3: mm_getpwnamallow: entering [preauth]
debug3: mm_request_send: entering, type 8 [preauth]
debug3: mm_getpwnamallow: waiting for MONITOR_ANS_PWNAM [preauth]
debug3: mm_request_receive_expect: entering, type 9 [preauth]
debug3: mm_request_receive: entering [preauth]
debug3: mm_request_receive: entering
debug3: monitor_read: checking request 8
debug3: mm_answer_pwnamallow: entering
debug2: parse_server_config_depth: config reprocess config len 214
debug3: auth_shadow_acctexpired: today 18865 sp_expire -1 days left -18866
debug3: account expiration disabled
debug3: mm_answer_pwnamallow: sending MONITOR_ANS_PWNAM: 1
debug3: mm_request_send: entering, type 9
debug2: monitor_read: 8 used once, disabling now
debug2: input_userauth_request: setting up authctxt for root [preauth]
debug3: mm_inform_authserv: entering [preauth]
debug3: mm_request_send: entering, type 4 [preauth]
debug2: input_userauth_request: try method none [preauth]
debug3: user_specific_delay: user specific delay 0.000ms [preauth]
debug3: ensure_minimum_time_since: elapsed 10.980ms, delaying 9.319ms (requested 5.075ms) [preauth]
debug1: monitor_read_log: child log fd closed
debug3: mm_request_receive: entering
debug3: monitor_read: checking request 4
debug3: mm_answer_authserv: service=ssh-connection, style=
debug2: monitor_read: 4 used once, disabling now
debug3: mm_request_receive: entering
debug1: do_cleanup
debug1: Killing privsep child 245
#
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
