From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:13:38 +0100
Subject: [Buildroot] Docker client does not function correctly in 2018.11
In-Reply-To: <607d909eed104898b2e059e0326a4415@exitstrategytech.com> (David
 J. Fogle's message of "Fri, 7 Dec 2018 16:19:04 +0000")
References: <ac041379a2d04fbeb3900fae7bab51be@exitstrategytech.com>
 <8dcf0b32c7fe49e8b30b10a482f3f23a@exitstrategytech.com>
 <CA+h8R2pH=BTTh+farCMfJOW8dzYsUhN_ompMtc=Aaz4tQVbVXg@mail.gmail.com>
 <5db9d4aa533e4e8590b5c33d2bb47665@exitstrategytech.com>
 <p05ed2odjpa9vgdmd5cx9cew.1544054248971@email.android.com>
 <CA+h8R2orLF5mjc6g8qDwG5Sh0WMXicnLb9DTB_qQiTBoJd45yA@mail.gmail.com>
 <6e255ac5c09e4841ac67d6f383249556@exitstrategytech.com>
 <99kkgapwmjckouvyyw5vo6pe.1544060571584@email.android.com>
 <CA+h8R2oK2mPefnBQ9c-jd7m4Tc7=s-0nsCV965r9DpsVTULuaA@mail.gmail.com>
 <ec3f3d11856642d09f7a59f5d1fe3dbd@exitstrategytech.com>
 <CA+h8R2odgbjQYv2CbQBGCn-6mPcw3_AJoPuXhBdATVtmb5HpcQ@mail.gmail.com>
 <d1afc122a10f4d4da893e5f9fc91bca3@exitstrategytech.com>
 <ff88c64bc71a4a3e816cf4c90a501ec3@exitstrategytech.com>
 <607d909eed104898b2e059e0326a4415@exitstrategytech.com>
Message-ID: <877eg9blv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David J Fogle <Dave@exitstrategytech.com> writes:

 > I have replicated the working configuration from Christian's skiff
 > branch for his SkiffOS into 2018.11, and the issue is 100% a version
 > mismatch in the docker components. Backporting the docker versions
 > from his build into 2018.11 should be sufficient to resolve the
 > issues. Is this something that I can assist in? If so, how would I go
 > about it?

I can reproduce it here as well. I have backported commit de336584d255bc
(package/docker-engine: split docker-{cli, engine}, bump to v18.09.0) to
2018.11.x, which fixes the issue for me.

This is be included in the upcoming 2018.11.1 release.

-- 
Bye, Peter Korsgaard
