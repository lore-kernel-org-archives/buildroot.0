From: Marcel <korgull@home.nl>
Date: Sat, 15 May 2010 17:18:44 +0200
Subject: [Buildroot] endian issue
In-Reply-To: <1273933182.28330.87.camel@coalu.atr>
References: <201005151547.02656.korgull@home.nl>
	<1273933182.28330.87.camel@coalu.atr>
Message-ID: <201005151718.44917.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 15 May 2010 04:19:42 pm Lionel Landwerlin wrote:
> The endianness configuration of your processor isn't something you can
> usually change 'on-the-fly'. It's usually set up early in the boot
> process.
> So you have to choose whether you want to compile all your system in big
> or little endian, you can select that from the buildroot architecture
> configuration (arm -> little, armeb -> big, for example).

That's clear. 
My board is being developed from an environment I got from in-circuit.
arm is selected (not armeb) and indeed the packages are compiled in little 
endian format. 

Are there any additional items I should be aware of when switching from arm to 
armeb ?
 
> > Is there any way to compile my package in big-endian mode from buildroot
> > ? Or is there another way I should force this ?
> 
> You can't select that for 1 package, it's for the whole system or
> nothing.
> Otherwise, the smartest approch would be to make endian detection (at
> compile time or at running time) to adapt your processing algorithm.

Well, the biggest issue I have is that my data that gets send out to the host 
PC must be in big-endian format. My drivers work this way too so the best 
would be if everything is big-endian so that I can transfer data from my 
drivers, through the package to the host PC without touching the data.
I could leave everything in little endian format but I would than have to 
reformat my data before sending it out. Although this is not all that difficult 
I don't like to waste time in that process.

Thanks for your reply,
Marcel

 
