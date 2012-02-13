From: Spenser Gilliland <spenser309@gmail.com>
Date: Mon, 13 Feb 2012 12:53:06 -0600
Subject: [Buildroot] simple question about dropbear
In-Reply-To: <E38CC59C-6BA9-4775-9A90-5D4C13A78902@informatik.uni-bremen.de>
References: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
 <871uq32cin.fsf@macbook.be.48ers.dk>
 <E38CC59C-6BA9-4775-9A90-5D4C13A78902@informatik.uni-bremen.de>
Message-ID: <CA+appbOjdSO6HqBNCALy_SmfkKycJNV_gHJqxY1aQbfyQbXMdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johannes,

I'm having a similar issue with dropbear and have switched to the
openssh server for now.  What patches are you using for microblaze
strace?  I'd like to add them to my build.

To add to this discussion on the client, ssh -vv returns the following
before stalling.

spenser at bourban:~/Code/buildroot/board/ecasp/ausp$ ssh -vv root at 192.168.1.117
OpenSSH_5.9p1 Debian-2ubuntu2, OpenSSL 1.0.0e 6 Sep 2011
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: Applying options for *
debug2: ssh_connect: needpriv 0
debug1: Connecting to 192.168.1.117 [192.168.1.117] port 22.
debug1: Connection established.
debug1: identity file /home/spenser/.ssh/id_rsa type 1
debug1: Checking blacklist file /usr/share/ssh/blacklist.RSA-2048
debug1: Checking blacklist file /etc/ssh/blacklist.RSA-2048
debug1: identity file /home/spenser/.ssh/id_rsa-cert type -1
debug1: identity file /home/spenser/.ssh/id_dsa type -1
debug1: identity file /home/spenser/.ssh/id_dsa-cert type -1
debug1: identity file /home/spenser/.ssh/id_ecdsa type -1
debug1: identity file /home/spenser/.ssh/id_ecdsa-cert type -1
debug1: Remote protocol version 2.0, remote software version dropbear_2011.54
debug1: no match: dropbear_2011.54
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_5.9p1 Debian-2ubuntu2
debug2: fd 3 setting O_NONBLOCK
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug2: kex_parse_kexinit:
ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
debug2: kex_parse_kexinit:
ecdsa-sha2-nistp256-cert-v01 at openssh.com,ecdsa-sha2-nistp384-cert-v01 at openssh.com,ecdsa-sha2-nistp521-cert-v01 at openssh.com,ssh-rsa-cert-v01 at openssh.com,ssh-dss-cert-v01 at openssh.com,ssh-rsa-cert-v00 at openssh.com,ssh-dss-cert-v00 at openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,ssh-rsa,ssh-dss
debug2: kex_parse_kexinit:
aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,aes192-cbc,aes256-cbc,arcfour,rijndael-cbc at lysator.liu.se
debug2: kex_parse_kexinit:
aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,aes192-cbc,aes256-cbc,arcfour,rijndael-cbc at lysator.liu.se
debug2: kex_parse_kexinit:
hmac-md5,hmac-sha1,umac-64 at openssh.com,hmac-sha2-256,hmac-sha2-256-96,hmac-sha2-512,hmac-sha2-512-96,hmac-ripemd160,hmac-ripemd160 at openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit:
hmac-md5,hmac-sha1,umac-64 at openssh.com,hmac-sha2-256,hmac-sha2-256-96,hmac-sha2-512,hmac-sha2-512-96,hmac-ripemd160,hmac-ripemd160 at openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit: none,zlib at openssh.com,zlib
debug2: kex_parse_kexinit: none,zlib at openssh.com,zlib
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit: first_kex_follows 0
debug2: kex_parse_kexinit: reserved 0
debug2: kex_parse_kexinit:
diffie-hellman-group1-sha1,diffie-hellman-group14-sha1
debug2: kex_parse_kexinit: ssh-rsa,ssh-dss
debug2: kex_parse_kexinit:
aes128-ctr,3des-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes256-cbc,twofish256-cbc,twofish-cbc,twofish128-cbc,blowfish-cbc
debug2: kex_parse_kexinit:
aes128-ctr,3des-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes256-cbc,twofish256-cbc,twofish-cbc,twofish128-cbc,blowfish-cbc
debug2: kex_parse_kexinit: hmac-sha1-96,hmac-sha1,hmac-md5
debug2: kex_parse_kexinit: hmac-sha1-96,hmac-sha1,hmac-md5
debug2: kex_parse_kexinit: zlib,zlib at openssh.com,none
debug2: kex_parse_kexinit: zlib,zlib at openssh.com,none
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit: first_kex_follows 0
debug2: kex_parse_kexinit: reserved 0
debug2: mac_setup: found hmac-md5
debug1: kex: server->client aes128-ctr hmac-md5 none
debug2: mac_setup: found hmac-md5
debug1: kex: client->server aes128-ctr hmac-md5 none
debug2: dh_gen_key: priv key bits set: 123/256
debug2: bits set: 983/2048
debug1: sending SSH2_MSG_KEXDH_INIT
debug1: expecting SSH2_MSG_KEXDH_REPLY

Spenser


On Mon, Feb 13, 2012 at 6:43 AM, Johannes Teiwes
<jteiwes@informatik.uni-bremen.de> wrote:
> Am 10.02.2012 um 11:44 schrieb Peter Korsgaard:
>
> "Johannes" == Johannes Teiwes <jteiwes@informatik.uni-bremen.de> writes:
>
>
> Johannes> Good morning!
>
> Johannes> I have dropbear configured to run on my target system. The
> Johannes> deamon process shows up in the process list. But as soon as i
> Johannes> connect from the outside via ssh the spawned dropbear process
> Johannes> takes up 100% cpu and never releases is, even when the
> Johannes> external connection request gets canceled. ?I have tried to
> Johannes> use the generated rsa/dss keys, login as a regular user (non
> Johannes> root) but its not changing anything. ?Have i overlooked
> Johannes> something? Does dropbear has a config like the openssh module
> Johannes> which can forbid (root-)login per default?
>
> It works fine here. Could you enable strace and use it to see what the
> dropbear process is doing?
>
> --
> Bye, Peter Korsgaard
>
>
> I managed to get strace running after digging a patch for my architecture
> (microblaze) but the output of tracing dropbear is not of great value.. i
> guess, that this is because the kernel is not compiled with tracing support
> - So the next problem, which arises then, is that the kernel
> (linux-2.6-xlnx) i am using does not support tracing (but i am still trying
> to find a workaroud for that)
>
> Nonetheless, i attached strace to the /usr/sbin/dropbear process, which is
> running from the start. Then i started a ssh connection from another
> computer and this is whats happened:
>
> # strace -p 58 -f
> Process 58 attached - interrupt to quit
> restart_syscall(<... resuming interrupted call ...>) = 0
> restart_syscall(<... resuming interrupted call ...>) = 0
> restart_syscall(<... resuming interrupted call ...>) = 0
> restart_syscall(<... resuming interrupted call ...>) = 0
> restart_syscall(<... resuming interrupted call ...>) = 0
> restart_syscall(<... resuming interrupted call ...>) = 0
> restart_syscall(<... resuming interrupted call ...> <unfinished ...>
> Process 58 detached
> #
>
> So far i can only tell, that dropbear gets stuck in the 7th system call it
> issues. Any ideas, which/what that could be?
>
> --
> Johannes Teiwes -?jteiwes at tzi.de
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Spenser Gilliland
Computer Engineer
Illinois Institute of Technology
