From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 Apr 2014 23:01:58 +0200
Subject: [Buildroot] Analysis of build failures, help requested!
In-Reply-To: <20140417213939.35afc5ff@skate>
References: <20140417063009.B2279100D24@stock.ovh.net>
 <20140417213939.35afc5ff@skate>
Message-ID: <53504146.4040507@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
...
>>     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/d7cd279e8e0145c2cd0d8611512af83be6379e72/
>
> checking snmp v3 status... required
> configure: error: in `/home/test/test/3/output/build/snmppp-3.3.4':
> configure: error: cryptographic library required for SNMPv3, but neither OpenSSL nor TomCrypt nor DES is available.
> See `config.log' for more details
>
> Luca, maybe ?
>

You committed the fix in:

   commit 15c5284d98168b9ccd3ff8cf9ba6ec82af75ac67
   Author: Luca Ceresoli <luca@lucaceresoli.net>
   Date:   Wed Apr 16 12:25:15 2014 +0200

       snmp++: need dynamic library support

       Fixes:
 
http://autobuild.buildroot.net/results/7b9/7b9ec11514219e5f315df0b30204f431b4c4f8a1/

       Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
       Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

The build failure occurred on the parent commit. Your build server
was faster that your commit ability! :)

-- 
Luca
