From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 16:34:47 +0100
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
In-Reply-To: <248515227.4438489.1478434416837.JavaMail.zimbra@datacom.ind.br>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
 <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <43363991-9d33-1b7c-7279-948cc2c1b2f3@mind.be>
 <248515227.4438489.1478434416837.JavaMail.zimbra@datacom.ind.br>
Message-ID: <374f5e2f-b1ab-7d7b-57d1-97f7431dc589@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-16 13:13, Henrique Marks wrote:
> Regarding the test comments, i think that part of the proposal is to show the
> tests written in Given-When-Then format without using nothing more than
> python and unittest class. Using GWT, it becomes easier to separate the
> pre-conditions, the operations to be tested, and the results. I think GWT
> exposes this nicely.
> 
> But, i must say that we (at Datacom) accepts both formats to tests, because
> there are cases where a tabular format is easier, and using GWT is just
> cumbersome. For instance, testing (ssh, sftp, https) connections is tabular,
> there is no preparation, and the operation and result comes together.
> 
> Another advantage of GWT here is to serve as an example. As buildroot is
> discussing test infra-structure, the GWT git tests are useful as an example
> on how to do it with GWT, python and unittest.

 Yes, it's good to have such an example so other Buildroot developers can get a
feel of it. But I suspect that most Buildroot developers will not find it
attractive. Maybe I shouldn't speak for others however :-)

 In my experience, the GWT format works well for integration tests because they
are completely black-box, and because the Given and When often hide complicated
setups and stubs. For unit tests, however, I don't see them working that well
because they tend to be more gray box than black box, and they often involve
sequential tests (do this, expect that, then do this, expect that). Doing a
when-then-when-then that relies on the sequencing is kind of breaking the concept.

 BTW, why do you distinguish GWT from tabular format? I've always used them
combined, like:

Given
Given
----------------------------
+ Foo    + Bar    + Expect +
----------------------------
+ When   + When   + Then   +
+ When   + When   + Then   +
+ When   + When   + Then   +
+ When   + When   + Then   +
----------------------------


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
