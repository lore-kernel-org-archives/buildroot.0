From: Michael Fischer <mf@go-sys.de>
Date: Thu, 13 Aug 2020 14:51:50 +0000
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <2377-5f354c00-1-2fb87dc0@59447183>
References: <b0c1b4805e9b4d1a9fd45ef4b552ab0a@go-sys.de>
 <2377-5f354c00-1-2fb87dc0@59447183>
Message-ID: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,
 here is the log, the connection is closed from the server.

PS: All settings between the commits are the same. 
The difference between this is only a git pull.


OpenSSH_8.3p1, OpenSSL 1.1.1g  21 Apr 2020
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 20: Applying options for *
debug1: Connecting to 192.168.1.194 [192.168.1.194] port 22.
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
debug1: Local version string SSH-2.0-OpenSSH_8.3
debug1: Remote protocol version 2.0, remote software version OpenSSH_8.3
debug1: match: OpenSSH_8.3 pat OpenSSH* compat 0x04000000
debug1: Authenticating to 192.168.1.194:22 as 'root'
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: ecdsa-sha2-nistp256
debug1: kex: server->client cipher: chacha20-poly1305 at openssh.com MAC: <implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305 at openssh.com MAC: <implicit> compression: none
debug1: kex: curve25519-sha256 need=64 dh_need=64
debug1: kex: curve25519-sha256 need=64 dh_need=64
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ecdsa-sha2-nistp256 SHA256:RCq6wRn5ZZrwZ7wY84zaMFMdG1mhIorheFPFhbwBz+0
debug1: Host '[192.168.1.194]:22' is known and matches the ECDSA host key.
debug1: Found key in /root/.ssh/known_hosts:1
debug1: rekey out after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: rekey in after 134217728 blocks
debug1: Will attempt key: /root/.ssh/id_rsa 
debug1: Will attempt key: /root/.ssh/id_dsa 
debug1: Will attempt key: /root/.ssh/id_ecdsa 
debug1: Will attempt key: /root/.ssh/id_ecdsa_sk 
debug1: Will attempt key: /root/.ssh/id_ed25519 
debug1: Will attempt key: /root/.ssh/id_ed25519_sk 
debug1: Will attempt key: /root/.ssh/id_xmss 
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info: server-sig-algs=<ssh-ed25519,sk-ssh-ed25519 at openssh.com,ssh-rsa,rsa-sha2-256,rsa-sha2-512,ssh-dss,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ecdsa-sha2-nistp256@openssh.com>
debug1: SSH2_MSG_SERVICE_ACCEPT received
Connection closed by 192.168.1.194 port 22

Regards,
  Michael.


> On Thursday, August 13, 2020 16:35 CEST, Michael Nosthoff <buildroot@heine.tech>
> wrote:
> 
> Hi Michael,
> 
> On Thursday, August 13, 2020 15:35 CEST, Michael Fischer <mf@go-sys.de>
> wrote:
> 
> > Dear all,
> >
> > I have a problem with the OpenSSH login on my raspberry.
> > I can't login via ssh, after entering the username, the sever closed the
> connection.
> >
> > I have checked it with the commit
> 01632805ab4be2bea4010ba1e46ab71f52d175a9 and this version works with
> the same configuration.
> > The actual commit doesn't work but  both commits have the same OpenSSH
> version.
> >
> > OpenSSH Version is:  OpenSSH_8.3p1, OpenSSL 1.1.1g  21 Apr 2020
> >
> > My SSHD logofile:
> >
> > debug2: parse_server_config_depth: config reprocess config len 236
> > debug3: auth_shadow_acctexpired: today 18487 sp_expire -1 days left -
> 18488
> > debug3: account expiration disabled
> > debug3: mm_answer_pwnamallow: sending MONITOR_ANS_PWNAM: 1
> > debug3: mm_request_send entering: type 9
> > debug2: monitor_read: 8 used once, disabling now
> > debug2: input_userauth_request: setting up authctxt for root [preauth]
> > debug3: mm_inform_authserv entering [preauth]
> > debug3: mm_request_send entering: type 4 [preauth]
> > debug2: input_userauth_request: try method none [preauth]
> > debug3: mm_request_receive entering
> > debug3: monitor_read: checking request 4
> > debug3: mm_answer_authserv: service=ssh-connection, style=
> > debug2: monitor_read: 4 used once, disabling now
> > debug3: user_specific_delay: user specific delay 0.000ms [preauth]
> > debug3: ensure_minimum_time_since: elapsed 10.528ms, delaying
> 10.089ms (requested 5.154ms) [preauth]
> > debug1: monitor_read_log: child log fd closed
> > debug3: mm_request_receive entering
> > debug1: do_cleanup
> > debug1: Killing privsep child 390
> >
> > I don't know what is going wrong.
> > Console login works and ftp also.
> >
> > Any help is welcome, I have no more idea where to look.
> >
> 
> Could you run the Client with the -v flag? So you could see if actually the client
> or the server is closing the connection.
> A pretty common problem is often a mismatch in available authentication
> mechanisms (commonly "publickey,password").
> 
> Also what sometimes is an issue is the permissions of the users .ssh folder on
> the server side.
> If it is globally readable sshd in many configurations refuses to authenticate
> against it.
> 
> Regards,
> Michael
> 
> >
> > thanks,
> >   Michael.
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
