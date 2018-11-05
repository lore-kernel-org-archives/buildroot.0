From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Nov 2018 09:26:37 +0100
Subject: [Buildroot] [PATCH 1/1] picotts: new package
In-Reply-To: <1e8836fe-f499-1067-c2a0-9c7e0821af6a@fanamoel.com>
References: <20181023082513.30099-1-inigohuguet@fanamoel.com>
 <20181102221146.4884a16b@windsurf>
 <1e8836fe-f499-1067-c2a0-9c7e0821af6a@fanamoel.com>
Message-ID: <20181105092637.2623858e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Nov 2018 08:52:02 +0100, I?igo Huguet wrote:

> The problem is that there is no upstream anywhere. This program source 
> was "extracted" from Android source, but there is not any "official" 
> team maintaining it. Actually, I got the source code from Ubuntu's 
> package and uploaded it to my own github.

Meh, Android is really wonderful open-source :-)

> About the scripts being use case specific, I think they're not. The 
> program only can create a .wav file, so if you want to use it to make 
> "on the fly" speech, you need to create a temporary wav, play it, and 
> delete it. This is in fact what the helper scripts do.
> 
> I you think they must be removed I will do it, please tell me exactly 
> what to do. Or, since the repository from which the package download the 
> program is mine, I can include them to my repo directly.

Yes, it would be nicer if you included them directly in your repo.

An example of something that was not completely correct is that your
script uses aplay, but the package does not select
BR2_PACAKAGE_ALSA_UTILS. But I believe it should not: there are
possible use cases for this text-to-speech engine that don't involve
playing the sound on the local device.

> > Please add a blank line, and then the upstream URL of the project.  
> 
> Same problem, there is not any upstream URL.

Just put the Github URL then :)

> It will work if I just add those packages as dependencies?

Yes, but we very much prefer to use <pkg>_AUTORECONF = YES when
possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
