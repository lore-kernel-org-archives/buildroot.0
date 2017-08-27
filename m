From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 27 Aug 2017 07:00:49 +0300
Subject: [Buildroot] [next v2 5/7] testing/tests/download: add git hash
 tests
In-Reply-To: <59a1f867a6b59_320e3fc04c9c84c4650da@ultri3.mail>
References: <20170826222056.6119-5-ricardo.martincoski@gmail.com>
 <59a1f867a6b59_320e3fc04c9c84c4650da@ultri3.mail>
Message-ID: <20170827040049.yv6cotumoua6xv37@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo,

On Sat, Aug 26, 2017 at 07:38:31PM -0300, Ricardo Martincoski wrote:
> On Sat, Aug 26, 2017 at 07:20 PM, Ricardo Martincoski wrote:
> > From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> > 
> > Add three test cases for hash of a git package:
> >  - correct hash;
> >  - wrong hash;
> >  - no hash file.
> > 
> > Besides the Python script, add some fixtures used during the tests:
> >  - a br2-external (git-hash) with one package for each test case;
> >  - a static git bare repo (repo.git) to be served using GitRemote class
> >    for all these test cases.
> > 
> > Neither the br2-external nor the check hash functionalities are the
> > subject of these tests per se, so for simplicity limit the check to the
> > error codes and don't look for the messages in the log.
> > 
> > Thanks to Arnout for the hint about how to add a bare repo to test.
> > 
> > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> > Changes v1 -> v2:
> >   - new patch
> > ---
> >  .gitlab-ci.yml                                     |   3 ++
> >  .../tests/download/br2-external/git-hash/Config.in |   0
> >  .../download/br2-external/git-hash/external.desc   |   1 +
> >  .../download/br2-external/git-hash/external.mk     |   1 +
> >  .../br2-external/git-hash/package/bad/bad.hash     |   1 +
> >  .../br2-external/git-hash/package/bad/bad.mk       |  12 ++++++++
> >  .../br2-external/git-hash/package/good/good.hash   |   1 +
> >  .../br2-external/git-hash/package/good/good.mk     |  12 ++++++++
> >  .../br2-external/git-hash/package/nohash/nohash.mk |  12 ++++++++
> >  .../download/git-remote/repo.git/.gitattributes    |   1 +
> >  .../tests/download/git-remote/repo.git/HEAD        |   1 +
> >  .../tests/download/git-remote/repo.git/config      |   4 +++
> >  .../12/33c8f882d130978246a30da75892321f13e5bb      | Bin 0 -> 49 bytes
> >  .../74/46f8dab6cdb166aaf130aa88633dc627a4e8ad      | Bin 0 -> 153 bytes
> >  .../8e/27be7d6154a1f68ea9160ef0e18691d20560dc      | Bin 0 -> 20 bytes
> >  .../download/git-remote/repo.git/refs/heads/master |   1 +
> >  support/testing/tests/download/test_git_hash.py    |  34 +++++++++++++++++++++
> >  17 files changed, 84 insertions(+)
> 
> This patch didn't get to mailing list.
> I guess it is because of binary files added.
> 
> Did I miss something to properly send this?
> 
> Anyway it can be seen here:
> https://gitlab.com/RicardoMartincoski/buildroot/commit/32611754f77a17dbbfae26e10da55300ebea0b83

I got this patch from the list. It is also archived at 
http://lists.busybox.net/pipermail/buildroot/2017-August/200933.html.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
