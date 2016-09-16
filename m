From: Mason <slash.tmp@free.fr>
Date: Fri, 16 Sep 2016 12:13:14 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
 root filesystem removal
In-Reply-To: <20160915212015.761725b7@free-electrons.com>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <aee7cccd-eb3a-d376-99b0-a9ba3cb950b2@mind.be>
 <20160915212015.761725b7@free-electrons.com>
Message-ID: <57DBC5BA.60803@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/09/2016 21:20, Thomas Petazzoni wrote:

> On Thu, 15 Sep 2016 18:19:01 +0200, Arnout Vandecappelle wrote:
> 
>> I'm sure I had a reason to add the /*, but I can't remember and the commit
>> message isn't helpful. The only difference (except for keeping the directory)
>> that I can think of is that .stamp files are kept, but (a) they should be
>> removed and (b) there aren't any stamp files in that directory...
> 
> I don't really see a reason for the /*, and it seems really dangerous :)

In fact, I think "rm -rf $(var)" would fail when var is empty.
And GNU rm errors out for "rm -rf /"
I agree that $(var)/* is rarely useful.

Regards.
