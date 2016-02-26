From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Fri, 26 Feb 2016 09:50:12 +0100
Subject: [Buildroot] [dropbear] fail ssh conection with Passwords encoding
	SHA-256 or SHA-512
Message-ID: <CALtfCQbqTNvokwneH9uFFESNFK6_HZWKy19oefELL4OgDw-jpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm new in buldroot and I'm building a raspberry 2 platform. I've based on
raspberrypi2_defconfig configuration. But I've changed two things:

1?.- I've added dropbear to add ssh functionality.

Everything works fine and I can connect to my raspberry by ssh (System
password encoding md5). The problem is when I've changed the password
encoding from md5 to SHA-256 or SHA-512. When I've tried to make an ssh
conection from a PC to my raspberry pi 2 the access fail:

root at 192.168.10.105's password:
Permission denied, please try again.

I attached you the log:

$ ssh -vvv root at 192.168.10.105
OpenSSH_6.6.1, OpenSSL 1.0.1f 6 Jan 2014
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: Applying options for *
debug2: ssh_connect: needpriv 0
debug1: Connecting to 192.168.10.105 [192.168.10.105] port 22.
debug1: Connection established.
debug1: identity file /home/username/.ssh/id_rsa type -1
debug1: identity file /home/username/.ssh/id_rsa-cert type -1
debug1: identity file /home/username/.ssh/id_dsa type -1
debug1: identity file /home/username/.ssh/id_dsa-cert type -1
debug1: identity file /home/username/.ssh/id_ecdsa type -1
debug1: identity file /home/username/.ssh/id_ecdsa-cert type -1
debug1: identity file /home/username/.ssh/id_ed25519 type -1
debug1: identity file /home/username/.ssh/id_ed25519-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_6.6.1p1 Ubuntu-2ubuntu2.6
debug1: Remote protocol version 2.0, remote software version
dropbear_2015.71
debug1: no match: dropbear_2015.71
debug2: fd 3 setting O_NONBLOCK
debug3: load_hostkeys: loading entries for host "192.168.10.105" from file
"/home/username/.ssh/known_hosts"
debug3: load_hostkeys: found key type ECDSA in file
/home/username/.ssh/known_hosts:1
debug3: load_hostkeys: loaded 1 keys
debug3: order_hostkeyalgs: prefer hostkeyalgs:
ecdsa-sha2-nistp256-cert-v01 at openssh.com,
ecdsa-sha2-nistp384-cert-v01 at openssh.com,
ecdsa-sha2-nistp521-cert-v01 at openssh.com
,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug2: kex_parse_kexinit: curve25519-sha256 at libssh.org
,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
debug2: kex_parse_kexinit: ecdsa-sha2-nistp256-cert-v01 at openssh.com,
ecdsa-sha2-nistp384-cert-v01 at openssh.com,
ecdsa-sha2-nistp521-cert-v01 at openssh.com
,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,
ssh-ed25519-cert-v01 at openssh.com,ssh-rsa-cert-v01 at openssh.com,
ssh-dss-cert-v01 at openssh.com,ssh-rsa-cert-v00 at openssh.com,
ssh-dss-cert-v00 at openssh.com,ssh-ed25519,ssh-rsa,ssh-dss
debug2: kex_parse_kexinit:
aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,
aes128-gcm at openssh.com,aes256-gcm at openssh.com,chacha20-poly1305 at openssh.com
,aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,aes192-cbc,aes256-cbc,arcfour,
rijndael-cbc at lysator.liu.se
debug2: kex_parse_kexinit:
aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,
aes128-gcm at openssh.com,aes256-gcm at openssh.com,chacha20-poly1305 at openssh.com
,aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,aes192-cbc,aes256-cbc,arcfour,
rijndael-cbc at lysator.liu.se
debug2: kex_parse_kexinit: hmac-md5-etm at openssh.com,
hmac-sha1-etm at openssh.com,umac-64-etm at openssh.com,umac-128-etm at openssh.com,
hmac-sha2-256-etm at openssh.com,hmac-sha2-512-etm at openssh.com,
hmac-ripemd160-etm at openssh.com,hmac-sha1-96-etm at openssh.com,
hmac-md5-96-etm at openssh.com,hmac-md5,hmac-sha1,umac-64 at openssh.com,
umac-128 at openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-ripemd160,
hmac-ripemd160 at openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit: hmac-md5-etm at openssh.com,
hmac-sha1-etm at openssh.com,umac-64-etm at openssh.com,umac-128-etm at openssh.com,
hmac-sha2-256-etm at openssh.com,hmac-sha2-512-etm at openssh.com,
hmac-ripemd160-etm at openssh.com,hmac-sha1-96-etm at openssh.com,
hmac-md5-96-etm at openssh.com,hmac-md5,hmac-sha1,umac-64 at openssh.com,
umac-128 at openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-ripemd160,
hmac-ripemd160 at openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit: none,zlib at openssh.com,zlib
debug2: kex_parse_kexinit: none,zlib at openssh.com,zlib
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit: first_kex_follows 0
debug2: kex_parse_kexinit: reserved 0
debug2: kex_parse_kexinit: curve25519-sha256 at libssh.org
,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1,
kexguess2 at matt.ucc.asn.au
debug2: kex_parse_kexinit: ecdsa-sha2-nistp521,ssh-rsa,ssh-dss
debug2: kex_parse_kexinit:
aes128-ctr,aes256-ctr,aes128-cbc,aes256-cbc,twofish256-cbc,twofish-cbc,twofish128-cbc,3des-ctr,3des-cbc
debug2: kex_parse_kexinit:
aes128-ctr,aes256-ctr,aes128-cbc,aes256-cbc,twofish256-cbc,twofish-cbc,twofish128-cbc,3des-ctr,3des-cbc
debug2: kex_parse_kexinit:
hmac-sha1-96,hmac-sha1,hmac-sha2-256,hmac-sha2-512,hmac-md5
debug2: kex_parse_kexinit:
hmac-sha1-96,hmac-sha1,hmac-sha2-256,hmac-sha2-512,hmac-md5
debug2: kex_parse_kexinit: none
debug2: kex_parse_kexinit: none
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit:
debug2: kex_parse_kexinit: first_kex_follows 0
debug2: kex_parse_kexinit: reserved 0
debug2: mac_setup: setup hmac-md5
debug1: kex: server->client aes128-ctr hmac-md5 none
debug2: mac_setup: setup hmac-md5
debug1: kex: client->server aes128-ctr hmac-md5 none
debug1: sending SSH2_MSG_KEX_ECDH_INIT
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ECDSA
42:7e:e2:3a:4c:af:04:bb:57:58:ac:5f:32:07:96:b7
debug3: load_hostkeys: loading entries for host "192.168.10.105" from file
"/home/username/.ssh/known_hosts"
debug3: load_hostkeys: found key type ECDSA in file
/home/username/.ssh/known_hosts:1
debug3: load_hostkeys: loaded 1 keys
debug1: Host '192.168.10.105' is known and matches the ECDSA host key.
debug1: Found key in /home/username/.ssh/known_hosts:1
debug1: ssh_ecdsa_verify: signature correct
debug2: kex_derive_keys
debug2: set_newkeys: mode 1
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug2: set_newkeys: mode 0
debug1: SSH2_MSG_NEWKEYS received
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug2: key: /home/username/.ssh/id_rsa ((nil)),
debug2: key: /home/username/.ssh/id_dsa ((nil)),
debug2: key: /home/username/.ssh/id_ecdsa ((nil)),
debug2: key: /home/username/.ssh/id_ed25519 ((nil)),
debug1: Authentications that can continue: publickey,password
debug3: start over, passed a different list publickey,password
debug3: preferred
gssapi-keyex,gssapi-with-mic,publickey,keyboard-interactive,password
debug3: authmethod_lookup publickey
debug3: remaining preferred: keyboard-interactive,password
debug3: authmethod_is_enabled publickey
debug1: Next authentication method: publickey
debug1: Trying private key: /home/username/.ssh/id_rsa
debug3: no such identity: /home/username/.ssh/id_rsa: No such file or
directory
debug1: Trying private key: /home/username/.ssh/id_dsa
debug3: no such identity: /home/username/.ssh/id_dsa: No such file or
directory
debug1: Trying private key: /home/username/.ssh/id_ecdsa
debug3: no such identity: /home/username/.ssh/id_ecdsa: No such file or
directory
debug1: Trying private key: /home/username/.ssh/id_ed25519
debug3: no such identity: /home/username/.ssh/id_ed25519: No such file or
directory
debug2: we did not send a packet, disable method
debug3: authmethod_lookup password
debug3: remaining preferred: ,password
debug3: authmethod_is_enabled password
debug1: Next authentication method: password
root at 192.168.10.105's password:
debug3: packet_send2: adding 64 (len 56 padlen 8 extra_pad 64)
debug2: we sent a password packet, wait for reply
debug1: Authentications that can continue: publickey,password
Permission denied, please try again.


?scar G?mez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160226/9e52b029/attachment.html>
