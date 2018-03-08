From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Mar 2018 10:56:19 +0100
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
In-Reply-To: <5aa107f1781f6_10e4c21b7c488cc@ultri3.mail>
References: <20180307234144.69fc987b@windsurf>
 <5aa107f1781f6_10e4c21b7c488cc@ultri3.mail>
Message-ID: <20180308105619.54b75ca1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 08 Mar 2018 06:52:49 -0300, Ricardo Martincoski wrote:

> > I didn't understand this part. Why would the results be different ?  
> 
> Indeed, it shouldn't.
> 
> I am not sure why it does. It only happens for packages that have more than one
> project with the exact same name. So we choose one guess over another.
> 
> You can check using this:
> 
> import json
> import os
> import subprocess
> def print_id(list):
>     for i in list['projects']:
>         if i['name'] == 'readline':
>             print(i['id'])
> API = "http://release-monitoring.org/api"
> url1 = os.path.join(API, "projects", "?pattern=%s" % 'readline')
> url2 = os.path.join(API, "projects")
> subprocess.call(['wget', '-O', 'readline', url1])
> subprocess.call(['wget', '-O', 'projects', url2])
> print_id(json.load(open('readline')))
> print_id(json.load(open('projects')))
> 
> It gives to me most of times (3 out 4):
> 913
> 4173
> 4173
> 913
> sometimes it gives me (1 out 4):
> 913
> 4173
> 913
> 4173
> It seems to not always return the same order. If I run the above script few
> times in a row the order is consistent. If I wait few hours the result can
> change.

Perhaps we should report this upstream to the people maintaining
release-monitoring.org ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
