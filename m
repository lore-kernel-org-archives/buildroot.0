From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Jan 2014 08:39:57 -0300
Subject: [Buildroot] [PATCH] Add SMS Tools Server 3 package
In-Reply-To: <52D82BEF.2030209@free.fr>
References: <1389194289-10657-1-git-send-email-julien.boibessot@free.fr>
 <52D6D25B.3040603@zacarias.com.ar> <52D82BEF.2030209@free.fr>
Message-ID: <52D9168D.50008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/16/2014 03:58 PM, Julien Boibessot wrote:

>>> +config BR2_PACKAGE_SMSTOOLS3_NB_MODEMS
>>> +	string "Number of modems to support"
>>> +	default 1
>> What does this knob do in/to the code?
> 
> It (NUMBER_OF_MODEMS) is used in a very large number of loops of the
> program and by default set to 64.
> 
> Doc says: "If you are running SMSTools3 in an embedded device, you can
> use NUMBER_OF_MODEMS=1 to save memory."
> 
> Don't know why the author didn't choose to take dynamic command
> parameters instead of static code define...

Ok, i'm usually not comfortable with this kind of tuning but it's up to
upstream to fix it.


> Well... no particular reason :-)
> /usr would be ok ?

Yes, /usr is the usual install directory, /usr/local is normally outside
of the PATH and not practical.
Historically it's reserved for customizations so it shouldn't be used
for a "default target".

> Thanks !
> I will send a corrected version tomorrow.

Thanks, looking forward to it :)
Regards.
