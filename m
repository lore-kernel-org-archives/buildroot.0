From: David J. Fogle <Dave@exitstrategytech.com>
Date: Fri, 7 Dec 2018 16:19:04 +0000
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <ff88c64bc71a4a3e816cf4c90a501ec3@exitstrategytech.com>
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
 <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
 <CA+h8R2pH=BTTh+farCMfJOW8dzYsUhN_ompMtc=Aaz4tQVbVXg@mail.gmail.com>
 <5db9d4aa533e4e8590b5c33d2bb47665@exitstrategytech.com>
 <p05ed2odjpa9vgdmd5cx9cew.1544054248971@email.android.com>
 <CA+h8R2orLF5mjc6g8qDwG5Sh0WMXicnLb9DTB_qQiTBoJd45yA@mail.gmail.com>
 <6e255ac5c09e4841ac67d6f383249556@exitstrategytech.com>
 <99kkgapwmjckouvyyw5vo6pe.1544060571584@email.android.com>
 <CA+h8R2oK2mPefnBQ9c-jd7m4Tc7=s-0nsCV965r9DpsVTULuaA@mail.gmail.com>
 <ec3f3d11856642d09f7a59f5d1fe3dbd@exitstrategytech.com>,
 <CA+h8R2odgbjQYv2CbQBGCn-6mPcw3_AJoPuXhBdATVtmb5HpcQ@mail.gmail.com>
 <d1afc122a10f4d4da893e5f9fc91bca3@exitstrategytech.com>,
 <ff88c64bc71a4a3e816cf4c90a501ec3@exitstrategytech.com>
Message-ID: <607d909eed104898b2e059e0326a4415@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have replicated the working configuration from Christian's skiff branch for his SkiffOS into 2018.11, and the issue is 100% a version mismatch in the docker components. Backporting the docker versions from his build into 2018.11 should be sufficient to resolve the issues. Is this something that I can assist in? If so, how would I go about it?

________________________________
From: David J. Fogle
Sent: Wednesday, December 5, 2018 8:36:06 PM
To: Christian Stewart
Cc: Matthew Weber; Hamilton Southworth; buildroot at busybox.net
Subject: RE: Re: Re: Docker client does not function correctly in 2018.11

I think I have myself mostly sorted, I will try to replicate this working config in the morning on 2018.11 , but as far as I can tell, my original issue of the flag being passed when not defined is resolved in your skiff build. I assume your skiff isn?t recommended for production use?

From: David J. Fogle <Dave@exitstrategytech.com>
Sent: Wednesday, December 5, 2018 8:24 PM
To: Christian Stewart <christian@paral.in>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>; Hamilton Southworth <hamilton@aperturerobotics.com>; buildroot at busybox.net
Subject: Re: Re: Re: Docker client does not function correctly in 2018.11

Well, as of now, I can start the docker-containerd without any flags, from the cli, and it works. The system unit hangs without output though.



David Fogle

CTO - Exit Strategy


-------- Original message --------
From: Christian Stewart <christian@paral.in>
Date: 12/5/18 8:22 PM (GMT-06:00)
To: "David J. Fogle" <Dave@exitstrategytech.com>
Cc: Christian Stewart <christian@paral.in>, Matthew Weber <matthew.weber@rockwellcollins.com>, Hamilton Southworth <hamilton@aperturerobotics.com>, buildroot at busybox.net
Subject: Re: Re: Re: Docker client does not function correctly in 2018.11

Hi David,

On Wed, Dec 5, 2018 at 6:18 PM David J. Fogle <Dave@exitstrategytech.com> wrote:
> I was able to get docker to run far enough along to complain about cgroup support lacking

The Docker developers created a script to check a kernel .config file
for the required options, you may find it useful.

https://github.com/docker/engine/blob/master/contrib/check-config.sh

Best regards,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181207/6f1c4678/attachment.html>
