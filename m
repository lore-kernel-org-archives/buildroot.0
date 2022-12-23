Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B2BC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 00:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E580A81E3A;
	Fri, 23 Dec 2022 00:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E580A81E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bG-2Vajmtuu; Fri, 23 Dec 2022 00:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D565481E3B;
	Fri, 23 Dec 2022 00:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D565481E3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31D741BF2B3
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 00:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1ED81E3B
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 00:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1ED81E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bO7HTKASFXLq for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 00:15:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1903481E3A
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1903481E3A
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 00:15:48 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3cbdd6c00adso46827887b3.11
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 16:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4sQGwq0dxVr2jaeX9MMx4M1aNfvBK7prFwNORcSeWxE=;
 b=sswPsSAet23ut00go17AnWVf859V9E6jHVXG8gInJAACu8rmCkzqiuuEHsQg+4WamS
 2022yknKpVDEKQxlX47BPI0JItJ5b4g49s2iNtl01l9oJq8kTqYcumsrktQSF91H/04p
 4E82O0Lu4/HpM0H6EzaH7nT6EFalT4dwM5aVYwTz7j04Na3ltpH7OM/YsRpfFfVGHjCZ
 vQ2y1Kar/mDtGfyOL/wf6Wyur0TowQukZVzPrkJ9kSQavS+8CAwYHklLLk2l1H2IQHhY
 LCOtgq3NQBql2/TkRDbleiMSNljCQeQCppcEbhfWKk1BaAiSSppIhkcUxpqY0hjdWSWr
 V9cg==
X-Gm-Message-State: AFqh2kq07SQ8gPcUAbIawg0NQLyhRVy6wa3c00Mis9kKtY8vuXoMOHKT
 ATXLTL0sX+xSvYln4EduKwuMCREPhSa57/WEFCCji0FM
X-Google-Smtp-Source: AMrXdXvUauCufCjeoZNpHWKz0I3N1vTbY8cC2PpvQcOD+rfxun5BIWAMal5hBEQFHdE7pzQCaTmf/0Ep6Z9lQQEShGI=
X-Received: by 2002:a81:830f:0:b0:35b:c180:d44c with SMTP id
 t15-20020a81830f000000b0035bc180d44cmr698523ywf.153.1671754546882; Thu, 22
 Dec 2022 16:15:46 -0800 (PST)
MIME-Version: 1.0
From: Alex Musatti <alex.musatti@gmail.com>
Date: Fri, 23 Dec 2022 01:15:35 +0100
Message-ID: <CA+brViFJP-ZAR0HA-6erOkbuk1FfBgbwWErXihrFhygYABGbmQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4sQGwq0dxVr2jaeX9MMx4M1aNfvBK7prFwNORcSeWxE=;
 b=pZvLp+w2btVMlXiGVZeAbM+p/rEQBPDKnSed7tdTBSE1CSwTEXPK+DX7z7FQU/q+WE
 Y6psEJPiDWyVkBIRycOBGoJl8kp7Y2gqTupTBmFaQH8BLSH295/utfhRsi0aCkLoEzcH
 eaoCPS68ECX7KKhm6tsMvbYtMhJ1Pq4XdOfxK7LYknWNS4+d7R3sKNQP0tVOlcukguia
 iXvKZWmrJadc1BT9qSTKtQ+HsR8D2Jlok4ZxixLw5FdBb1+OPBbN0va1sZvcTlz+FpT+
 1oUF+wZcnzsrFB04nufRGPV/NBQTOMWdDADWnryM3NbRUr/DFi3lXpNI2TYpLTj/Ru/o
 +XnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pZvLp+w2
Subject: [Buildroot] OpenSSH server connection reset
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1408827388769909489=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1408827388769909489==
Content-Type: multipart/alternative; boundary="000000000000eb2cdc05f073af9f"

--000000000000eb2cdc05f073af9f
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I've recently build firmware image for stm32mp157f-dk2.
I noticed sshd server closed the connection during key exchange, so I ran
it in debug mode:

#/usr/sbin/sshd -ddd -f /etc/ssh/sshd_config


debug2: load_server_config: filename /etc/ssh/sshd_config
debug2: load_server_config: done config len = 3120
debug2: parse_server_config_depth: config /etc/ssh/sshd_config len 3120
debug3: /etc/ssh/sshd_config:32 setting PermitRootLogin yes
debug3: /etc/ssh/sshd_config:42 setting AuthorizedKeysFile
.ssh/authorized_keys
debug3: /etc/ssh/sshd_config:110 setting Subsystem sftp
/usr/libexec/sftp-server
debug1: sshd version OpenSSH_9.1, OpenSSL 1.1.1q  5 Jul 2022
debug1: private host key #0: ssh-rsa
SHA256:QcnKh6l144ulIBNMY5QRbBRYP29BqZtikmrD+/OaP5o
debug1: private host key #1: ecdsa-sha2-nistp256
SHA256:w31P45n7NAE8ZINU1xgkuzfpjoCoaw2Q/4+PVh7Ek9k
debug1: private host key #2: ssh-ed25519
SHA256:pVwhrzsk0/WaJ6Q34g8iXhISoaBG+7tvL70VhcYXrY4
debug1: rexec_argv[0]='/usr/sbin/sshd'
debug1: rexec_argv[1]='-ddd'
debug1: rexec_argv[2]='-f'
debug1: rexec_argv[3]='/etc/ssh/sshd_config'
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
debug3: send_rexec_state: entering fd = 8 config len 3120
debug3: ssh_msg_send: type 0
debug3: send_rexec_state: done
debug1: rexec start in 5 out 5 newsock 5 pipe -1 sock 8
debug3: recv_rexec_state: entering fd = 5
debug3: ssh_msg_recv entering
debug3: recv_rexec_state: done
debug2: parse_server_config_depth: config rexec len 3120
debug3: rexec:32 setting PermitRootLogin yes
debug3: rexec:42 setting AuthorizedKeysFile .ssh/authorized_keys
debug3: rexec:110 setting Subsystem sftp        /usr/libexec/sftp-server
debug1: sshd version OpenSSH_9.1, OpenSSL 1.1.1q  5 Jul 2022
debug1: private host key #0: ssh-rsa
SHA256:QcnKh6l144ulIBNMY5QRbBRYP29BqZtikmrD+/OaP5o
debug1: private host key #1: ecdsa-sha2-nistp256
SHA256:w31P45n7NAE8ZINU1xgkuzfpjoCoaw2Q/4+PVh7Ek9k
debug1: private host key #2: ssh-ed25519
SHA256:pVwhrzsk0/WaJ6Q34g8iXhISoaBG+7tvL70VhcYXrY4
debug1: inetd sockets after dupping: 3, 3
Connection from 10.0.0.1 port 53486 on 10.0.0.2 port 22 rdomain ""
debug1: Local version string SSH-2.0-OpenSSH_9.1
debug1: Remote protocol version 2.0, remote software version OpenSSH_9.0
debug1: compat_banner: match: OpenSSH_9.0 pat OpenSSH* compat 0x04000000
debug2: fd 3 setting O_NONBLOCK
debug3: ssh_sandbox_init: preparing seccomp filter sandbox
debug2: Network child is on pid 270
debug3: preauth child monitor started
debug3: privsep user:group 100:101 [preauth]
debug1: permanently_set_uid: 100/101 [preauth]
debug3: ssh_sandbox_child_debugging: installing SIGSYS handler [preauth]
debug3: ssh_sandbox_child: setting PR_SET_NO_NEW_PRIVS [preauth]
debug3: ssh_sandbox_child: attaching seccomp filter program [preauth]
debug3: append_hostkey_type: ssh-rsa key not permitted by HostkeyAlgorithms
[preauth]
debug1: list_hostkey_types:
rsa-sha2-512,rsa-sha2-256,ecdsa-sha2-nistp256,ssh-ed25519 [preauth]
debug3: send packet: type 20 [preauth]
debug1: SSH2_MSG_KEXINIT sent [preauth]
ssh_sandbox_violation: unexpected system call (arch:0x40000028,syscall:414
@ 0xb6b93e06) [preauth]
debug1: monitor_read_log: child log fd closed
debug3: mm_request_receive: entering
debug1: do_cleanup
debug1: Killing privsep child 270

Does someone else has encountered this issue? Any hints?

Thanks in advance
Regards
Alex

--000000000000eb2cdc05f073af9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr">Hello everyone,</div><div dir=3D"ltr"><b=
r></div><div dir=3D"ltr">I&#39;ve recently build firmware image for stm32mp=
157f-dk2.</div><div dir=3D"ltr">I noticed sshd server closed the connection=
 during key exchange, so I ran it in debug mode:</div><div dir=3D"ltr"><br>=
</div><div dir=3D"ltr">#/usr/sbin/sshd -ddd -f /etc/ssh/sshd_config</div><d=
iv dir=3D"ltr"><br></div><div dir=3D"ltr">=C2=A0 <br>debug2: load_server_co=
nfig: filename /etc/ssh/sshd_config<br>debug2: load_server_config: done con=
fig len =3D 3120<br>debug2: parse_server_config_depth: config /etc/ssh/sshd=
_config len 3120<br>debug3: /etc/ssh/sshd_config:32 setting PermitRootLogin=
 yes<br>debug3: /etc/ssh/sshd_config:42 setting AuthorizedKeysFile .ssh/aut=
horized_keys<br>debug3: /etc/ssh/sshd_config:110 setting Subsystem sftp /us=
r/libexec/sftp-server<br>debug1: sshd version OpenSSH_9.1, OpenSSL 1.1.1q =
=C2=A05 Jul 2022<br>debug1: private host key #0: ssh-rsa SHA256:QcnKh6l144u=
lIBNMY5QRbBRYP29BqZtikmrD+/OaP5o<br>debug1: private host key #1: ecdsa-sha2=
-nistp256 SHA256:w31P45n7NAE8ZINU1xgkuzfpjoCoaw2Q/4+PVh7Ek9k<br>debug1: pri=
vate host key #2: ssh-ed25519 SHA256:pVwhrzsk0/WaJ6Q34g8iXhISoaBG+7tvL70Vhc=
YXrY4<br>debug1: rexec_argv[0]=3D&#39;/usr/sbin/sshd&#39;<br>debug1: rexec_=
argv[1]=3D&#39;-ddd&#39;<br>debug1: rexec_argv[2]=3D&#39;-f&#39;<br>debug1:=
 rexec_argv[3]=3D&#39;/etc/ssh/sshd_config&#39;<br>debug3: oom_adjust_setup=
<br>debug1: Set /proc/self/oom_score_adj from 0 to -1000<br>debug2: fd 3 se=
tting O_NONBLOCK<br>debug1: Bind to port 22 on 0.0.0.0.<br>Server listening=
 on 0.0.0.0 port 22.<br>debug2: fd 4 setting O_NONBLOCK<br>debug3: sock_set=
_v6only: set socket 4 IPV6_V6ONLY<br>debug1: Bind to port 22 on ::.<br>Serv=
er listening on :: port 22.<br>debug3: fd 5 is not O_NONBLOCK<br>debug1: Se=
rver will not fork when running in debugging mode.<br>debug3: send_rexec_st=
ate: entering fd =3D 8 config len 3120<br>debug3: ssh_msg_send: type 0<br>d=
ebug3: send_rexec_state: done<br>debug1: rexec start in 5 out 5 newsock 5 p=
ipe -1 sock 8<br>debug3: recv_rexec_state: entering fd =3D 5<br>debug3: ssh=
_msg_recv entering<br>debug3: recv_rexec_state: done<br>debug2: parse_serve=
r_config_depth: config rexec len 3120<br>debug3: rexec:32 setting PermitRoo=
tLogin yes<br>debug3: rexec:42 setting AuthorizedKeysFile .ssh/authorized_k=
eys<br>debug3: rexec:110 setting Subsystem sftp =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/usr/libexec/sftp-server<br>debug1: sshd version OpenSSH_9.1, OpenSSL 1.1.1=
q =C2=A05 Jul 2022<br>debug1: private host key #0: ssh-rsa SHA256:QcnKh6l14=
4ulIBNMY5QRbBRYP29BqZtikmrD+/OaP5o<br>debug1: private host key #1: ecdsa-sh=
a2-nistp256 SHA256:w31P45n7NAE8ZINU1xgkuzfpjoCoaw2Q/4+PVh7Ek9k<br>debug1: p=
rivate host key #2: ssh-ed25519 SHA256:pVwhrzsk0/WaJ6Q34g8iXhISoaBG+7tvL70V=
hcYXrY4<br>debug1: inetd sockets after dupping: 3, 3<br>Connection from 10.=
0.0.1 port 53486 on 10.0.0.2 port 22 rdomain &quot;&quot;<br>debug1: Local =
version string SSH-2.0-OpenSSH_9.1<br>debug1: Remote protocol version 2.0, =
remote software version OpenSSH_9.0<br>debug1: compat_banner: match: OpenSS=
H_9.0 pat OpenSSH* compat 0x04000000<br>debug2: fd 3 setting O_NONBLOCK<br>=
debug3: ssh_sandbox_init: preparing seccomp filter sandbox<br>debug2: Netwo=
rk child is on pid 270<br>debug3: preauth child monitor started<br>debug3: =
privsep user:group 100:101 [preauth]<br>debug1: permanently_set_uid: 100/10=
1 [preauth]<br>debug3: ssh_sandbox_child_debugging: installing SIGSYS handl=
er [preauth]<br>debug3: ssh_sandbox_child: setting PR_SET_NO_NEW_PRIVS [pre=
auth]<br>debug3: ssh_sandbox_child: attaching seccomp filter program [preau=
th]<br>debug3: append_hostkey_type: ssh-rsa key not permitted by HostkeyAlg=
orithms [preauth]<br>debug1: list_hostkey_types: rsa-sha2-512,rsa-sha2-256,=
ecdsa-sha2-nistp256,ssh-ed25519 [preauth]<br>debug3: send packet: type 20 [=
preauth]<br>debug1: SSH2_MSG_KEXINIT sent [preauth]<br>ssh_sandbox_violatio=
n: unexpected system call (arch:0x40000028,syscall:414 @ 0xb6b93e06) [preau=
th]<br>debug1: monitor_read_log: child log fd closed<br>debug3: mm_request_=
receive: entering<br>debug1: do_cleanup<br>debug1: Killing privsep child 27=
0</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Does someone else has en=
countered this issue? Any hints?<br></div><div dir=3D"ltr"><br></div><div d=
ir=3D"ltr">Thanks in advance</div><div dir=3D"ltr">Regards</div><div dir=3D=
"ltr">Alex</div></div>

--000000000000eb2cdc05f073af9f--

--===============1408827388769909489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1408827388769909489==--
