From: =?windows-1252?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Date: Sat, 29 Nov 2014 20:41:52 +0100
Subject: [Buildroot] [PATCH V3 2/5] package/squid: add init script
In-Reply-To: <20141123221807.48818807@free-electrons.com>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>	<1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>	<1416322487-14247-3-git-send-email-guillaume.gardet@oliseo.fr>
 <20141123221807.48818807@free-electrons.com>
Message-ID: <547A2180.2000905@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 23/11/2014 22:18, Thomas Petazzoni a ?crit :
> Dear Guillaume GARDET,
>
> On Tue, 18 Nov 2014 15:54:44 +0100, Guillaume GARDET wrote:
>
>> +# (Re)create log directory and give access to squid user (nobody)
>> +if [ ! -d $SQUID_LOG_DIR ]; then
>> +	mkdir -p $SQUID_LOG_DIR
>> +	chmod 777 $SQUID_LOG_DIR
> Clearly, this doesn't look good. Don't we have a better option than 777
> the log directory?

Maybe create a squid user? Not sure how to handle this in buildroot. What do you think?

>
>> +    restart | force-reload)
>> +	$0 stop
>> +	sleep 2
> sleep 2 really needed here?

Not sure.

>
>> +	$0 start
>> +	if [ "$?" != "0" ]; then
>> +		exit 1
>> +	fi
>> +	;;
>> +     *)
>> +	echo "Usage: /etc/init.d/S97squid {start|stop|restart|force-reload}"
> Replace /etc/init.d/S97squid by $0 maybe?

If you want.


Guillaume
