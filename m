From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 13 Aug 2020 16:19:54 +0200
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <b0c1b4805e9b4d1a9fd45ef4b552ab0a@go-sys.de>
Message-ID: <2377-5f354c00-1-2fb87dc0@59447183>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

On Thursday, August 13, 2020 15:35 CEST, Michael Fischer <mf@go-sys.de> wrote: 
 
> Dear all,
> 
> I have a problem with the OpenSSH login on my raspberry. 
> I can't login via ssh, after entering the username, the sever closed the connection.
> 
> I have checked it with the commit 01632805ab4be2bea4010ba1e46ab71f52d175a9 and this version works with the same configuration.
> The actual commit doesn't work but  both commits have the same OpenSSH version.
> 
> OpenSSH Version is:  OpenSSH_8.3p1, OpenSSL 1.1.1g  21 Apr 2020
> 
> My SSHD logofile:
> 
> debug2: parse_server_config_depth: config reprocess config len 236
> debug3: auth_shadow_acctexpired: today 18487 sp_expire -1 days left -18488
> debug3: account expiration disabled
> debug3: mm_answer_pwnamallow: sending MONITOR_ANS_PWNAM: 1
> debug3: mm_request_send entering: type 9
> debug2: monitor_read: 8 used once, disabling now
> debug2: input_userauth_request: setting up authctxt for root [preauth]
> debug3: mm_inform_authserv entering [preauth]
> debug3: mm_request_send entering: type 4 [preauth]
> debug2: input_userauth_request: try method none [preauth]
> debug3: mm_request_receive entering
> debug3: monitor_read: checking request 4
> debug3: mm_answer_authserv: service=ssh-connection, style=
> debug2: monitor_read: 4 used once, disabling now
> debug3: user_specific_delay: user specific delay 0.000ms [preauth]
> debug3: ensure_minimum_time_since: elapsed 10.528ms, delaying 10.089ms (requested 5.154ms) [preauth]
> debug1: monitor_read_log: child log fd closed
> debug3: mm_request_receive entering
> debug1: do_cleanup
> debug1: Killing privsep child 390
> 
> I don't know what is going wrong.
> Console login works and ftp also.
> 
> Any help is welcome, I have no more idea where to look.
> 

Could you run the Client with the -v flag? So you could see if actually the client or the server is closing the connection.
A pretty common problem is often a mismatch in available authentication mechanisms (commonly "publickey,password").

Also what sometimes is an issue is the permissions of the users .ssh folder on the server side. 
If it is globally readable sshd in many configurations refuses to authenticate against it.

Regards,
Michael

> 
> thanks,
>   Michael.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
