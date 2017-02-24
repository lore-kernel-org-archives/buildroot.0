From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Feb 2017 23:03:45 +0100
Subject: [Buildroot] No GPS data on ttymxc1 with busybox,
 but it works with systemd
In-Reply-To: <BY2PR03MB314570B07617BEF30F0C0A3BF520@BY2PR03MB314.namprd03.prod.outlook.com>
References: <BY2PR03MB314CD45BE8ACFAD060BF954BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
 <20170220095026.7150a532@free-electrons.com>
 <BY2PR03MB31431BC964FD7F0A71C5021BF5E0@BY2PR03MB314.namprd03.prod.outlook.com>
 <BY2PR03MB314570B07617BEF30F0C0A3BF520@BY2PR03MB314.namprd03.prod.outlook.com>
Message-ID: <ddb155aa-391a-58d5-f11f-7c6f554f8b0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-02-17 22:40, Brent Sink wrote:
>> Hello,
> 
>> 
>> Perhaps systemd is automatically initializing the serial ports to some
>> given speed/configuration.
>> 
>> Make sure you configure your serial port to the right
>> speed/configuration using the "stty" program.
> 
> I'm still trying to figure how systemd configures the serial ports, but I can't
> seem to find out where it does anything at all to the serial ports?  Does anyone
> have any ideas where systemd would configure the serial ports?  The only thing I
> found is where it sets up the console, which is ttymxc0 in my case.  Other than
> that, I don't see where it configures the remaining serial ports.

 Perhaps systemd has a .service file to start gpsd and that is configuring your
GPS to output something? Or gpsd is started differently or configured differently?


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
