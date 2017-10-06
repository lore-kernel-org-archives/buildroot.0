From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 23:02:32 +0200
Subject: [Buildroot] [next v2 2/7] testing/infra/builder: build with
 target and environment
In-Reply-To: <6455fdd0-c445-09cd-d249-ebfaf275c3fb@mind.be>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-2-ricardo.martincoski@gmail.com>
 <6455fdd0-c445-09cd-d249-ebfaf275c3fb@mind.be>
Message-ID: <8f08d633-1956-c734-7317-fdf0b849123f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-10-17 22:42, Arnout Vandecappelle wrote:
> 
> On 27-08-17 00:20, Ricardo Martincoski wrote:
>> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
[snip]
>> +        cmd = ["make", "O={}".format(self.builddir)]
>> +        if makecmdline:
>> +            cmd += makecmdline
>  This allows only a single options to be passed. I would require make_extra_opts
> to be an iterable and do cmd.extend(make_extra_opts) here.

 Sorry, += is the same as extend, of course...

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
