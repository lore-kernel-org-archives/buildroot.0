From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Tue, 15 Apr 2008 11:40:11 +0200
Subject: [Buildroot] atstk1002_defconfig problems and (possible) fix
In-Reply-To: <200804150846.51504.buildroot.atmel.com@pollet.net>
References: <48045BB1.9000406@logicway.de>
	<200804150846.51504.buildroot.atmel.com@pollet.net>
Message-ID: <480477FB.5010208@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michel (BusError) a ?crit :
> On Tuesday 15 April 2008, Arndt Kritzner wrote:
> [...]
>> this doesn't work any more:
>> BR2_LINUX_COPYTO_TFTPBOOT=y
>> BR2_LINUX_COPYTO=""
>>
>>> in my local copy changed to BR2_LINUX_COPYTO="/tftpboot"

This is a side effect of the patch that fix the BR2_LINUX_COPYTO 
handling by removing the hardcoded "/tftpboot/". The default 
configuration file that set the BR2_LINUX_COPYTO_TFTPBOOT to 'y' but set 
the BR2_LINUX_COPYTO to "" are broken now and should be fixed by setting 
BR2_LINUX_COPYTO="/tftpboot" exactly like you do.

--
Jean-Christian de Rivaz
